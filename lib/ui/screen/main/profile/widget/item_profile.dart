import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ItemProfile extends StatelessWidget {
  final bool? isBottomLine;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onPress;
  final Color? itemColor;
  const ItemProfile(
      {Key? key,
      this.isBottomLine = true,
      required this.title,
      this.subtitle,
      this.icon,
      this.itemColor,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
            border: Border(
                bottom: isBottomLine!
                    ? BorderSide(color: secondaryColor60, width: 1)
                    : const BorderSide(color: Colors.transparent))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                //margin: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleStyle.copyWith(
                          fontSize: 15.sp, color: titleColor),
                    ),
                  ],
                ),
              ),
            ),
            subtitle != null
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subtitle ?? "",
                          style: titleStyle.copyWith(
                              fontSize: 15.sp, color: greyPrymaryColor),
                        ),
                      ],
                    ),
                  )
                : Container(),
            itemColor != null
                ? Container(
                    width: 18.h,
                    height: 18.h,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                  )
                : Container(),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.sp,
                color: greyPrymaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
