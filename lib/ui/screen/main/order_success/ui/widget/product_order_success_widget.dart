import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProductOrderSuccessWidget extends StatelessWidget {
  final bool isLast;
  const ProductOrderSuccessWidget({Key? key, this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddingWidthWidget),
      decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(bottom: BorderSide(color: secondaryColor))),
      child: Row(
        children: [
          Container(
            height: 80.w,
            width: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: secondaryColor),
          ),
          Padding(
            padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pink Hoodie t-shirt full',
                  style: titleStyle,
                ),
                Text('Size: S, Qty: 1',
                    style: subTitlePrimaryColorStyle.copyWith(
                        color: contentColor, height: 1.h)),
                Text('đ110.000',
                    style: subTitlePrimaryColorStyle.copyWith(
                        color: titleColor, height: 1.h))
              ],
            ),
          )
        ],
      ),
    );
  }
}
