import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CountdownBanner extends StatelessWidget {
  const CountdownBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 200.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: kDefaultPaddingScreen.h),
            decoration: const BoxDecoration(color: secondaryColor),
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Denim Wear",
                    style: subTitleStyle,
                  ),
                  SizedBox(
                    height: kDefaultPaddingScreen.h,
                  ),
                  Text(
                    LocaleKeys.start_discount.tr(),
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: kDefaultPaddingScreen.h,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.only(right: kDefaultPaddingScreen.w),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius),
                      ),
                    ),
                    Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.only(right: kDefaultPaddingScreen.w),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius),
                      ),
                    ),
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: kDefaultPaddingScreen.h,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: contentColor))),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 3.h),
                      child: Text(
                        LocaleKeys.discover_now.tr(),
                        style: titleStyle.copyWith(color: contentColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                padding: EdgeInsets.zero,
                child: Image.asset(
                  AppPath.bannerCountdown,
                  fit: BoxFit.fitHeight,
                ),
              ))
        ],
      ),
    );
  }
}
