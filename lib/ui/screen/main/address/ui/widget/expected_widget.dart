import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ExpectedWidget extends StatelessWidget {
  const ExpectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      margin: EdgeInsets.only(bottom: kDefaultPaddingWidthWidget),
      padding: EdgeInsets.all(kDefaultPaddingWidthScreen),
      decoration: BoxDecoration(
          color: secondaryColor25, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            height: 70.h,
            width: 70.h,
            margin: EdgeInsets.only(right: kDefaultPaddingWidthWidget),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(3)),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Áo Hoodie Hồng',
                  style: titleStyle,
                ),
                Text(
                  'Nhận hàng vào 25 TH01 - 27 TH01',
                  style:
                      subTitleStyle.copyWith(color: Colors.green, height: 1.h),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
