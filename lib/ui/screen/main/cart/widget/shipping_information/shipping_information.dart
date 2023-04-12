import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ShippingInformation extends StatelessWidget {
  const ShippingInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(AddressPage()),
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              left: kDefaultPaddingScreen.w,
              right: kDefaultPaddingScreen.w,
              bottom: kDefaultPaddingWidget.h),
          height: 45.h,
          decoration: BoxDecoration(
              color: secondaryColor45,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 6.h),
                  child: Icon(Ionicons.car_outline, size: 26.sp)),
              SizedBox(
                width: kDefaultPaddingScreen.w,
              ),
              Text(
                LocaleKeys.free_ship.tr(),
                style: subTitleStyle,
              )
            ],
          )),
    );
  }
}
