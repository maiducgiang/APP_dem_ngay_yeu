import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mubaha/data/model/products_list/get_filter_options_response.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CategoryPopUp extends StatefulWidget {
  CategoryPopUp(
      {Key? key,
      required this.onBack,
      required this.categoriesOptions,
      required this.selectedCategory,
      this.onClose})
      : super(key: key);
  final Function(
    CategoryModel selectedCategory,
  )? onBack;

  final Function()? onClose;

  final CategoryModel selectedCategory;
  final List<CategoryModel> categoriesOptions;

  @override
  State<CategoryPopUp> createState() => _CategoryPopUpState();
}

class _CategoryPopUpState extends State<CategoryPopUp> {
  late CategoryModel selectedCategory;
  late List<CategoryModel> categoriesOptions;
  @override
  void initState() {
    setState(() {
      selectedCategory = widget.selectedCategory;
      categoriesOptions = widget.categoriesOptions;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
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
                        "Danh mục",
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
                    itemCount: categoriesOptions.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        // highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            selectedCategory = categoriesOptions[index];
                          });
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
                                    categoriesOptions[index].category.name,
                                    style: titleStyle.copyWith(fontSize: 13.sp),
                                  ),
                                ),
                                Container(
                                  width: 18.w,
                                  height: 18.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.r),
                                      border: Border.all(
                                          width: 0.6.w,
                                          color: categoriesOptions[index] !=
                                                  selectedCategory
                                              ? Colors.grey
                                              : primaryColor)),
                                  child: selectedCategory ==
                                          categoriesOptions[index]
                                      ? Container(
                                          width: 8.w,
                                          height: 8.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              color: primaryColor),
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
                padding: EdgeInsets.only(
                    right: 8.w, top: 16.w, bottom: 8.w, left: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          selectedCategory = CategoryModel(
                              category: CategoryItemModel(id: "", name: ""));
                        });
                      },
                      child: Visibility(
                        visible: selectedCategory.category.id != "",
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Column(
                            children: [
                              Text("Làm mới",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  )),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                padding: EdgeInsets.zero,
                                width: 60.w,
                                height: 1.h,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (selectedCategory.category.name == "") {
                          widget.onClose?.call();
                        } else {
                          await widget.onBack?.call(selectedCategory);
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
