import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/data/model/products_list/get_filter_options_response.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProductFilterModal extends StatefulWidget {
  ProductFilterModal(
      {Key? key,
      this.onBack,
      required this.stockCountriesOptions,
      required this.listBrandsOptions,
      required this.categoriesOptions,
      required this.priceRangeOptions,
      required this.starsOptions,
      this.selectedStockCountry,
      this.selectedBrand,
      this.selectedCategory,
      this.selectedPriceRange,
      this.selectedStar})
      : super(key: key);
  final Function(
      PriceRangeModel? selectedPriceRange,
      CategoryModel? selectedCategory,
      List<FilterBrandsModel>? selectedBrands,
      List<StockCountryModel>? selectedStockCountry,
      StarModel? selectedStart)? onBack;
  // final Function(String test)? onBack;
  final List<StockCountryModel> stockCountriesOptions;
  final List<FilterBrandsModel> listBrandsOptions;
  final List<CategoryModel> categoriesOptions;
  final List<PriceRangeModel> priceRangeOptions;
  final List<StarModel> starsOptions;
  final List<StockCountryModel>? selectedStockCountry;
  final List<FilterBrandsModel>? selectedBrand;
  final CategoryModel? selectedCategory;
  final PriceRangeModel? selectedPriceRange;
  final StarModel? selectedStar;

  @override
  State<ProductFilterModal> createState() => _ProductFilterModalState();
}

class _ProductFilterModalState extends State<ProductFilterModal> {
  late List<StockCountryModel> stockCountriesOptions;
  late List<FilterBrandsModel> listBrandsOptions;
  late List<CategoryModel> categoriesOptions;
  late List<PriceRangeModel> priceRangeOptions;
  late List<StarModel> starsOptions;
  late List<StockCountryModel>? selectedStockCountry;
  late List<FilterBrandsModel>? selectedBrand;
  late CategoryModel? selectedCategory;
  late PriceRangeModel? selectedPriceRange;
  late StarModel? selectedStar;
  var categoryAmount = 3;
  var locationAmount = 3;
  var brandAmount = 3;
  @override
  void initState() {
    setState(() {
      stockCountriesOptions = widget.stockCountriesOptions;
      listBrandsOptions = widget.listBrandsOptions;
      categoriesOptions = widget.categoriesOptions;
      priceRangeOptions = widget.priceRangeOptions;
      starsOptions = widget.starsOptions;
      selectedStockCountry = widget.selectedStockCountry;
      selectedBrand = widget.selectedBrand;
      selectedCategory = widget.selectedCategory;
      selectedPriceRange = widget.selectedPriceRange;
      selectedStar = widget.selectedStar;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          vertical: kDefaultPaddingScreen.h,
          horizontal: kDefaultPaddingScreen.w),
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            renderHeader(context),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Visibility(
                        visible: categoriesOptions.isNotEmpty,
                        child: renderCategory(
                            context,
                            categoriesOptions,
                            selectedCategory,
                            categoryAmount, (bool isShowMore) {
                          if (isShowMore == true) {
                            setState(() {
                              categoryAmount = categoriesOptions.length;
                            });
                          } else {
                            setState(() {
                              categoryAmount = 3;
                            });
                          }
                        }, (CategoryModel item) {
                          setState(() {
                            selectedCategory = item;
                          });
                        })),
                    Visibility(
                        visible: stockCountriesOptions.isNotEmpty,
                        child: renderLocation(
                            context,
                            stockCountriesOptions,
                            selectedStockCountry,
                            locationAmount, (bool isShowMore) {
                          if (isShowMore == true) {
                            setState(() {
                              locationAmount = stockCountriesOptions.length;
                            });
                          } else {
                            setState(() {
                              locationAmount = 3;
                            });
                          }
                        }, (StockCountryModel item) {
                          setState(() {
                            if (selectedStockCountry != null) {
                              final findItem = selectedStockCountry!
                                  .where((element) =>
                                      element.country == item.country)
                                  .toList();
                              if (findItem.isNotEmpty) {
                                final newList = selectedStockCountry!
                                    .where((element) =>
                                        element.country != item.country)
                                    .toList();
                                selectedStockCountry = newList;
                              } else {
                                selectedStockCountry?.add(item);
                              }
                              // selectedStockCountry?.add(item);
                            } else {
                              return;
                            }
                          });
                        })),
                    Visibility(
                        visible: listBrandsOptions.isNotEmpty,
                        child: renderBrand(context, listBrandsOptions,
                            selectedBrand, brandAmount, (bool isShowMore) {
                          if (isShowMore == true) {
                            setState(() {
                              brandAmount = listBrandsOptions.length;
                            });
                          } else {
                            setState(() {
                              brandAmount = 3;
                            });
                          }
                        }, (FilterBrandsModel item) {
                          setState(() {
                            if (selectedBrand != null) {
                              final findItem = selectedBrand!
                                  .where((element) =>
                                      element.brand.id == item.brand.id)
                                  .toList();
                              if (findItem.isNotEmpty) {
                                final newList = selectedBrand!
                                    .where((element) =>
                                        element.brand.id != item.brand.id)
                                    .toList();
                                selectedBrand = newList;
                              } else {
                                selectedBrand?.add(item);
                              }
                              // selectedStockCountry?.add(item);
                            } else {
                              return;
                            }
                          });
                        })),
                    Visibility(
                        visible: priceRangeOptions.isNotEmpty,
                        child: renderPriceRange(
                            context, priceRangeOptions, selectedPriceRange,
                            (PriceRangeModel item) {
                          setState(() {
                            selectedPriceRange = item;
                          });
                        })),
                    Visibility(
                        visible: starsOptions.isNotEmpty,
                        child: renderStar(context, starsOptions, selectedStar!,
                            (StarModel item) {
                          setState(() {
                            selectedStar = item;
                          });
                        })),
                  ],
                ),
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(vertical: kDefaultPaddingScreen.h),
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.7.w, color: Colors.grey))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBrand = [];
                        selectedStockCountry = [];
                        selectedStar = StarModel(rating: "1", title: "");
                        selectedPriceRange =
                            PriceRangeModel(min: "0", max: "0", title: "");
                        selectedCategory = CategoryModel(
                          category: CategoryItemModel(id: "", name: ""),
                        );
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Text("Xoá tất cả", style: titleStyle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onBack?.call(selectedPriceRange, selectedCategory,
                          selectedBrand, selectedStockCountry, selectedStar);
                      Navigator.pop(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border:
                                Border.all(width: 0.7.w, color: Colors.grey),
                            color: Colors.black),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidget.w,
                            vertical: kDefaultPaddingScreen.h),
                        child: Text(
                          "Xem kết quả",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Widget renderHeader(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: 6.h),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.7.w, color: Colors.grey))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5.h),
          alignment: Alignment.centerLeft,
          width: 30.w,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Ionicons.close_outline,
              size: 20.sp,
            ),
          ),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Text("Bộ lọc",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp)),
        )),
        Container(
          width: 30.w,
        ),
      ],
    ),
  );
}

Widget renderCategory(
    BuildContext context,
    List<CategoryModel> categoriesOptions,
    CategoryModel? selectedCategory,
    int amount,
    Function(bool isShowMore) onBack,
    Function(CategoryModel item) handleSelectedCategory) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(bottom: 10.h),
    margin: EdgeInsets.only(top: 5.h),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.7.w, color: Colors.grey))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Danh mục",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(top: 10.h),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: amount,
            itemBuilder: (ctx, index) {
              return InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                // highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  handleSelectedCategory.call(categoriesOptions[index]);
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          child: Text(
                            categoriesOptions[index].category.name,
                            style: titleStyle.copyWith(
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          width: 18.w,
                          height: 18.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              // border: Border.all(
                              //     width: 0.6.w,
                              //     color: categoriesOptions[index] !=
                              //             selectedProvinceData
                              //         ? Colors.grey
                              //         : ThemeServices().isDarkMode
                              //             ? kColorPrimaryDark
                              //             : kColorPrimaryLight)
                              border:
                                  Border.all(width: 1.w, color: Colors.grey)),
                          child: selectedCategory?.category.id ==
                                  categoriesOptions[index].category.id
                              ? Container(
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: Colors.black),
                                )
                              : Container(),
                        )
                      ],
                    )),
              );
            },
          ),
        ),
        Visibility(
            visible: categoriesOptions.length > 3,
            child: Container(
                margin: EdgeInsets.only(top: 10.h),
                child: amount == 3
                    ? GestureDetector(
                        onTap: () {
                          onBack.call(true);
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 3.h),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.7.w, color: Colors.grey))),
                          child: Text("Hiển thị thêm",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          onBack.call(false);
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 3.h),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.7.w, color: Colors.grey))),
                          child: Text("Thu gọn",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )))
      ],
    ),
  );
}

Widget renderLocation(
    BuildContext context,
    List<StockCountryModel> stockCountriesOptions,
    List<StockCountryModel>? listSelectedStockCountry,
    int amount,
    Function(bool isShowMore) onBack,
    Function(StockCountryModel item) handleAddSelectLocation) {
  return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 10.h),
      margin: EdgeInsets.only(top: kDefaultPaddingWidget.h),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.7.w, color: Colors.grey))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nguồn hàng",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(top: 10.h),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: amount,
              itemBuilder: (ctx, index) {
                final StockCountryModel item = stockCountriesOptions[index];
                final findItem = listSelectedStockCountry != null
                    ? listSelectedStockCountry
                        .where((element) => element.country == item.country)
                        .toList()
                    : [];
                return InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  // highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    handleAddSelectLocation.call(stockCountriesOptions[index]);
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            child: Text(
                              displayCountry(
                                  stockCountriesOptions[index].country),
                              style: titleStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            width: 18.w,
                            height: 18.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: findItem.isNotEmpty
                                    ? Colors.black
                                    : Colors.transparent,
                                border: Border.all(
                                    width: 0.6.w,
                                    color: findItem.isNotEmpty
                                        ? Colors.transparent
                                        : Colors.black)
                                // border:
                                //     Border.all(width: 1.w, color: Colors.grey)

                                ),
                            child: findItem.isNotEmpty
                                ? Icon(
                                    Ionicons.checkmark_outline,
                                    color: Colors.white,
                                    size: 15.sp,
                                  )
                                : Container(),
                          )
                        ],
                      )),
                );
              },
            ),
          ),
          Visibility(
              visible: stockCountriesOptions.length > 3,
              child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: amount == 3
                      ? GestureDetector(
                          onTap: () {
                            onBack.call(true);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 3.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.7.w, color: Colors.grey))),
                            child: Text("Hiển thị thêm",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            onBack.call(false);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 3.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.7.w, color: Colors.grey))),
                            child: Text("Thu gọn",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )))
        ],
      ));
}

Widget renderBrand(
    BuildContext context,
    List<FilterBrandsModel> listBrandsOptions,
    List<FilterBrandsModel>? listSelectedBrands,
    int amount,
    Function(bool isShowMore) onBack,
    Function(FilterBrandsModel item) handleAddSelectBrand) {
  return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 10.h),
      margin: EdgeInsets.only(top: kDefaultPaddingWidget.h),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.7.w, color: Colors.grey))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Thương hiệu",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(top: 10.h),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: amount,
              itemBuilder: (ctx, index) {
                final FilterBrandsModel item = listBrandsOptions[index];
                final findItem = listSelectedBrands != null
                    ? listSelectedBrands
                        .where((element) => element.brand.id == item.brand.id)
                        .toList()
                    : [];
                return InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  // highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    handleAddSelectBrand.call(item);
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            child: Text(
                              listBrandsOptions[index].brand.name,
                              style: titleStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            width: 18.w,
                            height: 18.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: findItem.isNotEmpty
                                    ? Colors.black
                                    : Colors.transparent,
                                border: Border.all(
                                    width: 0.6.w,
                                    color: findItem.isNotEmpty
                                        ? Colors.transparent
                                        : Colors.black)),
                            child: findItem.isNotEmpty
                                ? Icon(
                                    Ionicons.checkmark_outline,
                                    color: Colors.white,
                                    size: 15.sp,
                                  )
                                : Container(),
                          )
                        ],
                      )),
                );
              },
            ),
          ),
          Visibility(
              visible: listBrandsOptions.length > 3,
              child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: amount == 3
                      ? GestureDetector(
                          onTap: () {
                            onBack.call(true);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 3.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.7.w, color: Colors.grey))),
                            child: Text("Hiển thị thêm",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            onBack.call(false);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 3.h),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.7.w, color: Colors.grey))),
                            child: Text("Thu gọn",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )))
        ],
      ));
}

Widget renderPriceRange(
    BuildContext context,
    List<PriceRangeModel> listPrice,
    PriceRangeModel? selectedPriceRange,
    Function(PriceRangeModel item) handleSelectedPriceRange) {
  return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 10.h),
      margin: EdgeInsets.only(top: kDefaultPaddingWidget.h),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.7.w, color: Colors.grey))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Khoảng giá",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(top: 10.h),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listPrice.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  // highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    handleSelectedPriceRange.call(listPrice[index]);
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            child: Text(
                              listPrice[index].title,
                              style: titleStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            width: 18.w,
                            height: 18.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.r),
                                // border: Border.all(
                                //     width: 0.6.w,
                                //     color: categoriesOptions[index] !=
                                //             selectedProvinceData
                                //         ? Colors.grey
                                //         : ThemeServices().isDarkMode
                                //             ? kColorPrimaryDark
                                //             : kColorPrimaryLight)
                                border:
                                    Border.all(width: 1.w, color: Colors.grey)),
                            child: selectedPriceRange?.title ==
                                    listPrice[index].title
                                ? Container(
                                    width: 8.w,
                                    height: 8.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: Colors.black),
                                  )
                                : Container(),
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ));
}

Widget renderStar(BuildContext context, List<StarModel> listReview,
    StarModel selectedStar, Function(StarModel item) handleSelectStar) {
  return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 10.h),
      margin: EdgeInsets.only(top: kDefaultPaddingWidget.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Đánh giá",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(top: 10.h),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listReview.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  // highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    handleSelectStar.call(listReview[index]);
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            child: Text(
                              listReview[index].title,
                              style: titleStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            width: 18.w,
                            height: 18.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.r),
                                border:
                                    Border.all(width: 1.w, color: Colors.grey)),
                            child: selectedStar.title == listReview[index].title
                                ? Container(
                                    width: 8.w,
                                    height: 8.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: Colors.black),
                                  )
                                : Container(),
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ));
}

displayCountry(String type) {
  switch (type) {
    case "VN":
      return 'Việt Nam';
    case "US":
      return "Hoa Kỳ";
    case "EU":
      return "Châu Âu";
    case "CN":
      return "Trung Quốc";
    case "JP":
      return "Nhật Bản";
    case "KR":
      return "Hàn Quốc";
  }
}
