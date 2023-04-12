import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ItemSocial(socialItem: AppPath.googleIcon),
        ItemSocial(socialItem: AppPath.facebookIcon),
        ItemSocial(socialItem: AppPath.appleIcon),
      ],
    );
  }
}

class ItemSocial extends StatelessWidget {
  final String socialItem;
  const ItemSocial({Key? key, required this.socialItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      height: 50.w,
      width: 50.w,
      decoration: BoxDecoration(
          color: itemColor, borderRadius: BorderRadius.circular(3)),
      child: SvgPicture.asset(socialItem),
    );
  }
}
