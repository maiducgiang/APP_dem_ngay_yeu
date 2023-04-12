import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
      margin: EdgeInsets.symmetric(vertical: kDefaultPaddingWidget.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.cart_detail.tr(),
            style: headingStyle,
          ),
          SizedBox(
            height: kDefaultPaddingScreen.h,
          ),
          renderBody(context)
        ],
      ),
    );
  }
}

Widget renderBody(BuildContext context) {
  return GestureDetector(
    onTap: () => context.router.push(PaymentCartPage()),
    child: Container(
      margin: EdgeInsets.only(top: kDefaultPaddingWidget.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.money.tr(),
                style: subTitleStyle,
              ),
              Text(
                "đ220.000",
                style: subTitleStyle.copyWith(color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: kDefaultPaddingWidget.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.discount.tr(),
                style: subTitleStyle,
              ),
              Text(
                "-đ20.00",
                style: subTitleStyle.copyWith(color: Colors.green),
              )
            ],
          ),
          SizedBox(
            height: kDefaultPaddingWidget.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.voucher.tr(),
                style: subTitleStyle,
              ),
              Text(
                LocaleKeys.apply.tr(),
                style: subTitleStyle.copyWith(color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: kDefaultPaddingWidget.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.transport_fee.tr(),
                style: subTitleStyle,
              ),
              Text(
                "đ0",
                style: subTitleStyle,
              )
            ],
          ),
          SizedBox(
            height: kDefaultPaddingWidget.h,
          ),
          Container(
              padding: EdgeInsets.zero,
              height: 1,
              width: double.infinity,
              color: secondaryColor),
          SizedBox(
            height: kDefaultPaddingWidget.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.total_amount.tr(),
                style: titleStyle,
              ),
              Text(
                "đ200.000",
                style: titleStyle,
              )
            ],
          ),
        ],
      ),
    ),
  );
}
