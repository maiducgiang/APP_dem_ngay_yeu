import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class BaseBottom extends StatelessWidget {
  final String? leftButton;
  final String rightButton;
  final String? price;
  final String? subTitle;
  final bool isButton;
  final Function()? onPressRight;
  final Function()? onPressLeft;
  final bool enableLeftButton;
  final bool enableRightButton;
  final bool oneButton;
  final Color? backgroundColor;

  const BaseBottom(
      {Key? key,
      this.leftButton,
      required this.rightButton,
      this.isButton = true,
      this.price,
      this.subTitle,
      this.onPressRight,
      this.onPressLeft,
      this.enableLeftButton = true,
      this.enableRightButton = true,
      this.oneButton = false,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return oneButton
        ? Container(
            height: 57.h,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: baseBottom))),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
            ),
            child: Center(
                child: PrimaryButton(
              label: rightButton,
              backgroundColor: backgroundColor ?? primaryColor,
            )),
          )
        : Container(
            padding: EdgeInsets.only(
                right: kDefaultPaddingWidth,
                left: isButton ? kDefaultPaddingWidth : 0),
            height: 57.h,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: baseBottom))),
            child: Row(
              children: [
                Expanded(
                    child: isButton
                        ? PrimaryButton.outlineColor(
                            label: leftButton ?? '',
                            onPressed: onPressLeft,
                            textColor: primaryColor,
                            borderColor: primaryColor,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                price!,
                                style: titleStyle,
                              ),
                              Text(
                                subTitle!,
                                style: subTitleStyle.copyWith(
                                    color: primaryColor, height: 1.h),
                              )
                            ],
                          )),
                SizedBox(width: kDefaultPaddingWidthScreen),
                Expanded(
                    child: PrimaryButton(
                  backgroundColor: primaryColor,
                  label: rightButton,
                  onPressed: onPressRight,
                )),
              ],
            ),
          );
  }
}
