import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CartAttribute extends StatelessWidget {
  const CartAttribute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: kDefaultPaddingWidget.h,
          horizontal: kDefaultPaddingScreen.w),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderAttributeItem(context, Ionicons.sync_outline,
              LocaleKeys.refund_within_7_days.tr()),
          renderAttributeItem(
              context, Ionicons.call_outline, LocaleKeys.support_247.tr()),
          renderAttributeItem(
              context, Ionicons.card_outline, LocaleKeys.secure_payment.tr()),
        ],
      ),
    );
  }
}

Widget renderAttributeItem(BuildContext context, IconData icon, String title) {
  return Expanded(
    child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPaddingScreen.w),
            decoration: BoxDecoration(
                color: secondaryColor45,
                borderRadius: BorderRadius.circular(23.r)),
            child: Icon(
              icon,
              size: 26.sp,
            ),
          ),
          SizedBox(
            height: kDefaultPaddingScreen.h,
          ),
          Text(title,
              style: titleStyle.copyWith(height: 1.5, fontSize: 12.sp),
              maxLines: 2,
              textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
