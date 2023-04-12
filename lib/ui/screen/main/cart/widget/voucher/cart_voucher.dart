import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CartVoucher extends StatelessWidget {
  const CartVoucher({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      // => context.router.push(VoucherPage()),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
        margin: EdgeInsets.symmetric(vertical: kDefaultPaddingWidget.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.voucher.tr() + ':',
              style: headingStyle,
            ),
            SizedBox(
              height: kDefaultPaddingScreen.h,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidget.w,
                  vertical: kDefaultPaddingWidget.h),
              decoration: BoxDecoration(
                  color: secondaryColor45,
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 2.h, right: kDefaultPaddingScreen.w),
                      child: const Icon(
                        Ionicons.cash_outline,
                        size: 24,
                      ),
                    ),
                    Text(
                      LocaleKeys.select_or_enter_voucher.tr(),
                      style: subHeadingStyle.copyWith(color: Colors.black),
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 2.h, right: kDefaultPaddingScreen.w),
                    child: const Icon(
                      Ionicons.chevron_forward_outline,
                      size: 24,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
