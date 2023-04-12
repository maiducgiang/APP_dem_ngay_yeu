import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'package:mubaha/ui/screen/main/products_list/widget/category_popup.dart';
import 'package:mubaha/ui/screen/main/products_list/widget/location_popup.dart';
import 'package:mubaha/ui/screen/main/products_list/widget/price_popup.dart';
import 'package:mubaha/ui/screen/main/products_list/widget/products_filter_modal.dart';
import 'package:mubaha/ui/screen/main/products_list/widget/rating_popup.dart';
import 'package:mubaha/ui/shared/base_screen.dart';
import 'package:mubaha/ui/shared/error_screen.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProductsListScreen extends StatefulWidget {
  ProductsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final ScrollController _scrollController = ScrollController();
  var isShowFilterOptions = true;
  var selectFilterOptions = "";
  @override
  void initState() {
    _scrollController.addListener(() {
      final direction = _scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        setState(() {
          isShowFilterOptions = true;
        });
      } else if (direction == ScrollDirection.reverse) {
        setState(() {
          isShowFilterOptions = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) =>
              ProductsListCubit(getIt.get<CustomerRepository>())
                ..getListProducts(),
          child: BlocConsumer<ProductsListCubit, ProductsListState>(
            listener: (context, state) {
              // if (state.isLoadingFilterOptions == false &&
              //     state.isFirstGetFilterOptions == true) {
              //   _showPickerModalPopup(context: context, state: state);
              // }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingScreen();
              } else if (state.isLoadingFilterOptions) {
                return const LoadingScreen();
              } else if (state.error?.isNotEmpty ?? false) {
                return ErrorScreen(
                  error: 'Oops! Đã có lỗi xảy ra',
                  hasAction: true,
                  actionTitle: 'Thử lại',
                  onTapped: () =>
                      context.read<ProductsListCubit>().getListProducts(),
                );
              } else {
                return BaseScreen(
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            renderHeader(context, state),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                controller: _scrollController,
                                child: Column(
                                  children: [
                                    state.listProducts.isEmpty
                                        ? Container(
                                            margin: EdgeInsets.only(top: 20.h),
                                            alignment: Alignment.center,
                                            child: Text(
                                                "Không tìm thấy kết quả",
                                                style: titleStyle),
                                          )
                                        : renderProductList(
                                            context, state.listProducts),
                                  ],
                                ),
                              ),
                            )),
                          ],
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
                                context
                                    .read<ProductsListCubit>()
                                    .handleFilterData(
                                        state.selectedPriceRange,
                                        item,
                                        state.selectedBrand,
                                        state.selectedStockCountry,
                                        state.selectedStar);
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
                      )
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}

Widget renderHeader(BuildContext context, ProductsListState state) {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPaddingScreen),
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
                await context.read<ProductsListCubit>().handleSearchText(text);
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
                    width: 5.w,
                  ),
                  Text(
                    state.text,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )),
          GestureDetector(
            onTap: () async {
              // await context.read<ProductsListCubit>().getFilterOptions();
              _showPickerModalPopup(context: context, state: state);
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

Widget renderProductList(BuildContext context, List<Product2> productsList) {
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
          final Product2 item = productsList[index];
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
