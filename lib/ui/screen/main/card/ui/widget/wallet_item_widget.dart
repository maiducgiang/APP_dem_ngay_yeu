import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class WalletItemWidget extends StatelessWidget {
  const WalletItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPaddingHeightWidget),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 65.h,
      decoration: BoxDecoration(
          color: secondaryColor25, borderRadius: BorderRadius.circular(3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(AppPath.vnpay),
              SizedBox(
                width: 5.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ví VNPAY',
                    style: titleStyle,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: 'Số dư: ', style: subTitleStyle),
                    TextSpan(
                        text: '2.xxx.xxxđ',
                        style: subTitleStyle.copyWith(color: Colors.black)),
                  ]))
                ],
              )
            ],
          ),
          Text(
            'Xoá liên kết',
            style: subTitleStyle.copyWith(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
