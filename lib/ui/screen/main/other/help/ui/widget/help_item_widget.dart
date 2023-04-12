import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class HelpItemWidget extends StatelessWidget {
  const HelpItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingWidthScreen),
      margin: EdgeInsets.only(bottom: kDefaultPaddingHeightScreen),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: secondaryColor25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Tôi không nhận được Hoàn tiền tức thì (Thẻ tín dụng / Ghi nợ)',
              style: titleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: contentColor,
                  height: 1.h),
            ),
          ),
          SizedBox(
            width: kDefaultPaddingWidthScreen,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
        ],
      ),
    );
  }
}
