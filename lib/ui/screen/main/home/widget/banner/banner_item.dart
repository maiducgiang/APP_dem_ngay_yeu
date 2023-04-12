import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({Key? key, required this.index, required this.bannerImage})
      : super(key: key);
  final int index;
  final String bannerImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPaddingScreen.w),
      padding: const EdgeInsets.only(right: kDefaultPaddingScreen),
      alignment: Alignment.center,
      height: double.infinity,
      decoration: BoxDecoration(
          color: secondaryColor45,
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
          image: DecorationImage(
              image: AssetImage(bannerImage), fit: BoxFit.cover)),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       LocaleKeys.splash_header_1.tr(),
      //       style: titleStyle.copyWith(fontSize: 15.sp),
      //     ),
      //     SizedBox(
      //       height: 6.h,
      //     ),
      //     Text(
      //       LocaleKeys.sale_50.tr(),
      //       style: titleStyle.copyWith(fontSize: 18.sp, color: primaryColor),
      //     ),
      //     SizedBox(
      //       height: 6.h,
      //     ),
      //     Text(
      //       LocaleKeys.free_ship.tr(),
      //       style: subTitleStyle,
      //     ),
      //     SizedBox(
      //       height: kDefaultPaddingScreen.h,
      //     ),
      //     Container(
      //       padding: EdgeInsets.zero,
      //       width: MediaQuery.of(context).size.width * .4,
      //       child: PrimaryButton(
      //           label: LocaleKeys.buy_now.tr(),
      //           borderRadius: BorderRadius.circular(4.r),
      //           onPressed: () {},
      //           paddingHeight: 8.h,
      //           paddingWidth: 8.w,
      //           style: const TextStyle(color: Colors.white)),
      //     )
      //   ],
      // ),
    );
  }
}
