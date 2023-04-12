import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mubaha/data/model/products_list/get_filter_options_response.dart';
import 'package:mubaha/ui/screen/main/products_list/widget/products_filter_modal.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class LocationPopup extends StatefulWidget {
  LocationPopup(
      {Key? key,
      required this.onBack,
      required this.stockCountriesOptions,
      required this.selectedStockCountry,
      this.onClose})
      : super(key: key);
  final Function(List<StockCountryModel> selectedStockCountry)? onBack;

  final Function()? onClose;

  final List<StockCountryModel> selectedStockCountry;
  final List<StockCountryModel> stockCountriesOptions;

  @override
  State<LocationPopup> createState() => _LocationPopupState();
}

class _LocationPopupState extends State<LocationPopup> {
  late List<StockCountryModel> selectedStockCountry;
  late List<StockCountryModel> stockCountriesOptions;
  @override
  void initState() {
    setState(() {
      selectedStockCountry = widget.selectedStockCountry;
      stockCountriesOptions = widget.stockCountriesOptions;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).backgroundColor,
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        widget.onClose?.call();
                      },
                      child: Container(
                          padding: EdgeInsets.zero,
                          width: 30.w,
                          height: 30.w,
                          child: Icon(
                            Icons.close_rounded,
                            size: 18.sp,
                          )),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Kho hàng",
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.black54),
                      ),
                    )),
                    Container(
                      padding: EdgeInsets.zero,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
                  // height: 350.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: stockCountriesOptions.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        // highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          if (selectedStockCountry
                              .contains(stockCountriesOptions[index])) {
                            setState(() {
                              selectedStockCountry = selectedStockCountry
                                  .where((element) =>
                                      element != stockCountriesOptions[index])
                                  .toList();
                            });
                          } else {
                            setState(() {
                              selectedStockCountry = [
                                ...selectedStockCountry,
                                stockCountriesOptions[index]
                              ];
                            });
                          }
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    displayCountry(
                                        stockCountriesOptions[index].country),
                                    style: titleStyle.copyWith(fontSize: 13.sp),
                                  ),
                                ),
                                Container(
                                  width: 18.w,
                                  height: 18.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      border: Border.all(
                                          width: 0.6,
                                          color: selectedStockCountry.contains(
                                                  stockCountriesOptions[index])
                                              ? primaryColor
                                              : Colors.black)),
                                  child: selectedStockCountry.contains(
                                          stockCountriesOptions[index])
                                      ? Icon(
                                          Ionicons.checkmark_outline,
                                          size: 16.sp,
                                          color: primaryColor,
                                        )
                                      : Container(),
                                )
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                    right: 8.w, top: 16.w, bottom: 8.w, left: 8.w),
                child: GestureDetector(
                  onTap: () async {
                    if (selectedStockCountry.isEmpty) {
                      widget.onClose?.call();
                    } else {
                      await widget.onBack?.call(selectedStockCountry);
                      widget.onClose?.call();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Text("Xác nhận",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
