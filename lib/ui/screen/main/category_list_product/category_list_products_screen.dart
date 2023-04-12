import 'dart:developer';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/data/model/products_list/get_filter_options_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/home/widget/style/product_primary_item.dart';
import 'package:mubaha/ui/screen/main/products_list/cubit/products_list_cubit.dart';
import 'package:mubaha/ui/screen/main/products_list/cubit/products_list_state.dart';
import 'package:mubaha/ui/screen/main/products_list/widget/products_filter_modal.dart';
import 'package:mubaha/ui/shared/base_screen.dart';
import 'package:mubaha/ui/shared/error_screen.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../data/model/product/product4.dart';
import 'cubit/category_product_list_cubit.dart';

class CategoryListProductsScreen extends StatefulWidget {
  CategoryListProductsScreen({Key? key, required this.id, required this.name})
      : super(key: key);
  final String id;
  final String name;
  @override
  State<CategoryListProductsScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<CategoryListProductsScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final _ControllerSmartRefresher = RefreshController(initialRefresh: false);
  late AnimationController _anicontroller, _scaleController;
  late AnimationController _footerController;
  bool hasPrevPage = true;
  bool hasNextPage = true;
  var isShowFilterOptions = true;
  var selectFilterOptions = "";
  @override
  void initState() {
    // _scrollController.addListener(() {
    //   final direction = _scrollController.position.userScrollDirection;
    //   if (direction == ScrollDirection.forward) {
    //     setState(() {
    //       isShowFilterOptions = true;
    //     });
    //   } else if (direction == ScrollDirection.reverse) {
    //     setState(() {
    //       isShowFilterOptions = false;
    //     });
    //   }
    // });

    // TODO: implement initState
    _anicontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _scaleController =
        AnimationController(value: 0.0, vsync: this, upperBound: 1.0);
    _footerController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _ControllerSmartRefresher.headerMode?.addListener(() {
      if (_ControllerSmartRefresher.headerStatus == RefreshStatus.idle) {
        _scaleController.value = 0.0;
        _anicontroller.reset();
      } else if (_ControllerSmartRefresher.headerStatus ==
          RefreshStatus.refreshing) {
        _anicontroller.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _ControllerSmartRefresher.dispose();
    _scaleController.dispose();
    _footerController.dispose();
    _anicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) =>
              CategoryProductListCubit(getIt.get<CustomerRepository>())
                ..getListProduct(10, id: widget.id),
          child: BaseScreen(
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      renderHeader(context, widget.name),
                      BlocBuilder<CategoryProductListCubit,
                          CategoryProductListState>(
                        builder: (context, state) {
                          if (state is CategoryProductListLoading) {
                            return Expanded(child: const LoadingScreen());
                          }

                          if (state is CategoryProductListLoadFailure) {
                            return Expanded(
                              child: ErrorScreen(
                                error: 'Oops! Đã có lỗi xảy ra',
                                hasAction: true,
                                actionTitle: 'Thử lại',
                                onTapped: () =>
                                    context.read<CategoryProductListCubit>()
                                      ..getListProduct(10, id: widget.id),
                                //context.read<ProductsListCubit>().getListProducts(),
                              ),
                            );
                          }
                          if (state is CategoryProductListLoadSuccess) {
                            return Expanded(
                                child: SmartRefresher(
                              enablePullDown: true,
                              enablePullUp: state.hasNextPage,
                              controller: _ControllerSmartRefresher,
                              // footer: Container(
                              //   height: kDefaultPaddingHeight*3,
                              //   child:  LoadingScreen(),
                              // ),
                              onRefresh: () async {
                                //await Future.delayed(Duration(milliseconds: 1000));
                                context
                                    .read<CategoryProductListCubit>()
                                    .getListProduct(10, id: widget.id);
                                _ControllerSmartRefresher.refreshCompleted();
                              },
                              onLoading: () async {
                                //await Future.delayed(Duration(milliseconds: 1000));
                                context
                                    .read<CategoryProductListCubit>()
                                    .getListProductPage(10,
                                        id: widget.id, page: state.page + 1);
                                _ControllerSmartRefresher.loadComplete();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  controller: _scrollController,
                                  child: Column(
                                    children: [
                                      state.products.isEmpty
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 20.h),
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "Không tìm thấy kết quả",
                                                  style: titleStyle),
                                            )
                                          : renderProductList(
                                              context, state.products),
                                    ],
                                  ),
                                ),
                              ),
                              footer: CustomFooter(
                                onModeChange: (mode) {
                                  if (mode == LoadStatus.loading) {
                                    _scaleController.value = 0.0;
                                    _footerController.repeat();
                                  } else {
                                    _footerController.reset();
                                  }
                                },
                                builder: (context, mode) {
                                  Widget child;
                                  switch (mode) {
                                    case LoadStatus.failed:
                                      child = Text("failed,click retry");
                                      break;
                                    case LoadStatus.noMore:
                                      child = Text("no more data");
                                      break;
                                    default:
                                      child = CircularProgressIndicator();
                                      // child = SpinKitFadingCircle(
                                      //   size: 30.0,
                                      //   controller: _footerController,
                                      //   itemBuilder: (_, int index) {
                                      //     return DecoratedBox(
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.grey, //index.isEven ? Colors.red : Colors.green,
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                      break;
                                  }
                                  return Container(
                                    height: 60,
                                    child: Center(
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                              header: CustomHeader(
                                refreshStyle: RefreshStyle.Behind,
                                onOffsetChange: (offset) {
                                  if (_ControllerSmartRefresher
                                          .headerMode?.value !=
                                      RefreshStatus.refreshing)
                                    _scaleController.value = offset / 80.0;
                                },
                                builder: (c, m) {
                                  return Container(
                                    child: FadeTransition(
                                      opacity: _scaleController,
                                      child: ScaleTransition(
                                        child: CircularProgressIndicator(),
                                        // SpinKitFadingCircle(
                                        //   size: 30.0,
                                        //   controller: _anicontroller,
                                        //   itemBuilder: (_, int index) {
                                        //     return DecoratedBox(
                                        //       decoration: BoxDecoration(
                                        //         color: index.isEven ? Colors.red : Colors.green,
                                        //       ),
                                        //     );
                                        //   },
                                        // ),
                                        scale: _scaleController,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  );
                                },
                              ),
                            ));
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
                /*Positioned(
                        bottom: 65.h,
                        left: 0.w,
                        right: 0.w,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingScreen.w),
                          height: selectFilterOptions == "category" &&
                                  isShowFilterOptions
                              ? MediaQuery.of(context).size.height * .7
                              : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CategoryPopUp(
                              onBack: (CategoryModel item) {
                                // context
                                //     .read<ProductsListCubit>()
                                //     .handleFilterData(
                                //         state.selectedPriceRange,
                                //         item,
                                //         state.selectedBrand,
                                //         state.selectedStockCountry,
                                //         state.selectedStar);
                              },
                              onClose: () {
                                setState(() {
                                  selectFilterOptions = "";
                                });
                              },
                              categoriesOptions: state.categoriesOptions,
                              selectedCategory: state.selectedCategory!),
                        ),
                      ),
                      Positioned(
                        bottom: 65.h,
                        left: 0.w,
                        right: 0.w,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingScreen.w),
                          height: selectFilterOptions == "location" &&
                                  isShowFilterOptions
                              ? 320.h
                              : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: LocationPopup(
                              onBack: (List<StockCountryModel> item) {
                                context
                                    .read<ProductsListCubit>()
                                    .handleFilterData(
                                        state.selectedPriceRange,
                                        state.selectedCategory!,
                                        state.selectedBrand,
                                        item,
                                        state.selectedStar);
                              },
                              onClose: () {
                                setState(() {
                                  selectFilterOptions = "";
                                });
                              },
                              stockCountriesOptions:
                                  state.stockCountriesOptions,
                              selectedStockCountry: state.selectedStockCountry),
                        ),
                      ),
                      Positioned(
                        bottom: 65.h,
                        left: 0.w,
                        right: 0.w,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingScreen.w),
                          height: selectFilterOptions == "price" &&
                                  isShowFilterOptions
                              ? 250.h
                              : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: PricePopup(
                              onBack: (PriceRangeModel item) {
                                context
                                    .read<ProductsListCubit>()
                                    .handleFilterData(
                                        item,
                                        state.selectedCategory!,
                                        state.selectedBrand,
                                        state.selectedStockCountry,
                                        state.selectedStar);
                              },
                              onClose: () {
                                setState(() {
                                  selectFilterOptions = "";
                                });
                              },
                              selectedPriceRange: state.selectedPriceRange,
                              priceRangeOptions: state.priceRangeOptions),
                        ),
                      ),
                      Positioned(
                        bottom: 65.h,
                        left: 0.w,
                        right: 0.w,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingScreen.w),
                          height: selectFilterOptions == "rating" &&
                                  isShowFilterOptions
                              ? 286.h
                              : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: RatingPopup(
                              onBack: (StarModel item) {
                                context
                                    .read<ProductsListCubit>()
                                    .handleFilterData(
                                        state.selectedPriceRange,
                                        state.selectedCategory!,
                                        state.selectedBrand,
                                        state.selectedStockCountry,
                                        item);
                              },
                              onClose: () {
                                setState(() {
                                  selectFilterOptions = "";
                                });
                              },
                              selectedStar: state.selectedStar,
                              starsOptions: state.starsOptions),
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        left: 0.w,
                        right: 0.w,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingScreen.w),
                          height: isShowFilterOptions ? 42.h : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: renderFilterOptions(context, state,
                              (String type) {
                            setState(() {
                              selectFilterOptions = type;
                            });
                          }),
                        ),
                      )*/
              ],
            ),
          )),
    );
  }
}

Widget renderHeader(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.only(
        top: kDefaultPaddingScreen, bottom: kDefaultPaddingScreen),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              child: Icon(
                Ionicons.chevron_back_outline,
                size: 20.sp,
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              context.router.push(SearchPage(onBack: (String text) async {
                //await context.read<ProductsListCubit>().handleSearchText(text);
              }));
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: kDefaultPaddingScreen.w,
                  right: kDefaultPaddingScreen.w,
                  top: 3.h),
              padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
              height: 26.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.search_outline,
                    size: 16.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )),
          GestureDetector(
            onTap: () async {
              // await context.read<ProductsListCubit>().getFilterOptions();
              //_showPickerModalPopup(context: context, state: state);
            },
            // onTap: () => _showPickerModalPopup(context: context, state: state),
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.zero,
              child: Icon(
                Ionicons.options_outline,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<dynamic> _showPickerModalPopup({
  required BuildContext context,
  required ProductsListState state,
}) {
  return showBarModalBottomSheet(
    context: context,
    expand: true,
    builder: (BuildContext context1) {
      return Container(
          color: Colors.white,
          child: ProductFilterModal(
            stockCountriesOptions: state.stockCountriesOptions,
            listBrandsOptions: state.listBrandsOptions,
            categoriesOptions: state.categoriesOptions,
            priceRangeOptions: state.priceRangeOptions,
            starsOptions: state.starsOptions,
            selectedStockCountry: state.selectedStockCountry,
            selectedBrand: state.selectedBrand,
            selectedCategory: state.selectedCategory,
            selectedPriceRange: state.selectedPriceRange,
            selectedStar: state.selectedStar,
            onBack: (PriceRangeModel? selectedPriceRange,
                CategoryModel? selectedCategory,
                List<FilterBrandsModel>? selectedBrands,
                List<StockCountryModel>? selectedStockCountry,
                StarModel? selectedStart) {
              context.read<ProductsListCubit>().handleFilterData(
                  selectedPriceRange!,
                  selectedCategory!,
                  selectedBrands!,
                  selectedStockCountry!,
                  selectedStart!);
            },
          ));
    },
  );
}

Widget renderProductList(BuildContext context, List<Product4> productsList) {
  return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen),
      margin: const EdgeInsets.symmetric(vertical: kDefaultPaddingScreen),
      child: GridView.builder(
        padding: EdgeInsets.only(top: kDefaultPaddingScreen.h),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: kDefaultPaddingScreen.w,
          crossAxisSpacing: kDefaultPaddingScreen.w,
        ),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          final Product4 item_product = productsList[index];
          final Product2 item = new Product2(
              media: item_product.media,
              id: item_product.id,
              name: item_product.name,
              price: item_product.price.toInt(),
              currencySymbol: item_product.currencySymbol,
              discount: item_product.discount,
              totalReviews: item_product.totalReviews ?? 0,
              slug: item_product.slug);
          return ProductPrimaryItem(
            index: index,
            product: item,
          );
        },
      ));
}

Widget renderFilterOptions(BuildContext context, ProductsListState state,
    Function(String type) onTap) {
  inspect(state);

  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
    // decoration:
    //     BoxDecoration(border: Border.all(width: 0.5.w, color: Colors.grey)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Visibility(
          visible: state.categoriesOptions.isNotEmpty,
          child: GestureDetector(
            onTap: () {
              onTap.call("category");
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.grid_outline,
                    size: 15.sp,
                    color: state.selectedCategory!.category.name != ""
                        ? primaryColor
                        : Colors.grey,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Danh mục",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: state.selectedCategory!.category.name != ""
                            ? primaryColor
                            : Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: state.categoriesOptions.isNotEmpty,
          child: GestureDetector(
            onTap: () {
              onTap.call("location");
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.navigate_circle_outline,
                    size: 15.sp,
                    color: state.selectedStockCountry.isNotEmpty
                        ? primaryColor
                        : Colors.grey,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Khu vực",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: state.selectedStockCountry.isNotEmpty
                            ? primaryColor
                            : Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: state.categoriesOptions.isNotEmpty,
          child: GestureDetector(
            onTap: () {
              onTap.call("price");
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.cash_outline,
                    size: 15.sp,
                    color: state.selectedPriceRange.title != ""
                        ? primaryColor
                        : Colors.grey,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Giá",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: state.selectedPriceRange.title != ""
                            ? primaryColor
                            : Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: state.categoriesOptions.isNotEmpty,
          child: GestureDetector(
            onTap: () {
              onTap.call("rating");
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.star_outline,
                    size: 15.sp,
                    color: state.selectedStar.title != ""
                        ? primaryColor
                        : Colors.grey,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Đánh giá",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: state.selectedStar.title != ""
                            ? primaryColor
                            : Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: state.categoriesOptions.isNotEmpty,
          child: GestureDetector(
            onTap: () {
              _showPickerModalPopup(context: context, state: state);
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.options_outline,
                    size: 15.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Tất cả",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
