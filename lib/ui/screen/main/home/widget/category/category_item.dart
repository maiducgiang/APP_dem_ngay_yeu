import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:mubaha/data/model/category/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final CategoryHomepage item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: index > 0 ? kDefaultPaddingScreen.w : 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: 60.w,
              height: 60.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 5.h,
                    left: 5.w,
                    bottom: 5.w,
                    right: 5.w,
                    child: Container(
                      decoration: BoxDecoration(
                          color: secondaryColor75,
                          borderRadius: BorderRadius.circular(60.w / 2)),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                          padding: EdgeInsets.zero,
                          width: 60.w,
                          height: 60.w,
                          child: Image.network(
                            item.featuredImage,
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: kDefaultPaddingScreen.h - 6.h,
            ),
            Container(
              padding: EdgeInsets.zero,
              width: 60.w,
              child: Text(
                item.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: textCategoryNameStyle.copyWith(height: 1.2),
              ),
            )
          ],
        ));
  }
}
