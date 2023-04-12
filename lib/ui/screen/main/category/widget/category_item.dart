import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:mubaha/data/model/category/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final Category item;
  final int index;
  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0) return evenItem(context, item);
    return oddItem(context, item);
  }
}

Widget evenItem(BuildContext context, Category item) {
  return Container(
      height: 100.h,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(bottom: kDefaultPaddingScreen.h - 3.h),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(vertical: kDefaultPaddingScreen.h - 3.h),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: kDefaultPaddingWidget.w),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: kDefaultPaddingScreen.h,
                  ),
                  Text(
                    item.description ?? "",
                    style: subTitleStyle,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              alignment: Alignment.centerRight,
              child: Image.network(
                item.featuredImage!,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ));
}

Widget oddItem(BuildContext context, Category item) {
  return Container(
      height: 100.h,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(bottom: kDefaultPaddingScreen.h - 3.h),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(vertical: kDefaultPaddingScreen.h - 3.h),
            child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: kDefaultPaddingWidget.w),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius:
                        BorderRadius.circular(kDefaultBorderRadius.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: kDefaultPaddingScreen.h,
                    ),
                    Text(
                      item.description ?? "",
                      style: subTitleStyle,
                    )
                  ],
                )),
          ),
          Positioned(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.network(
                item.featuredImage!,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ));
}
