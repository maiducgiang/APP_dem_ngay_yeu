import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class AmountWidget extends StatelessWidget {
  final int amount;
  final VoidCallback onPressDecrease;
  final VoidCallback onPressIncrease;
  final Color amountColor;
  final bool isTitle;
  const AmountWidget(
      {Key? key,
      required this.amount,
      required this.onPressDecrease,
      required this.onPressIncrease,
      required this.amountColor,
      this.isTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: isTitle,
          child: Text(
            LocaleKeys.amount.tr() + ':',
            style: subTitleStyle.copyWith(
                color: titleColor, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              width: 100.w,
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                  color: secondaryColor45,
                  borderRadius: BorderRadius.circular(5.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        amount > 1 ? onPressDecrease() : null;
                      },
                      child: Icon(
                        MdiIcons.minus,
                        color: amount > 1 ? amountColor : borderColor,
                        size: 15.sp,
                      )),
                  Text(
                    amount.toString(),
                    style: subHeadingStyle.copyWith(color: amountColor),
                  ),
                  GestureDetector(
                      onTap: () => onPressIncrease(),
                      child: Icon(
                        MdiIcons.plus,
                        color: amountColor,
                        size: 15.sp,
                      ))
                ],
              ),
            ))
      ],
    );
  }
}
