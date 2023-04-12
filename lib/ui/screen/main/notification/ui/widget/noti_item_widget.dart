import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class NotiItemWidget extends StatelessWidget {
  final bool isRead;
  final bool isLast;
  const NotiItemWidget({Key? key, this.isLast = false, this.isRead = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      decoration: BoxDecoration(
          color: isRead ? Colors.white : secondaryColor25,
          border: Border(
              bottom: BorderSide(
                  color: isLast ? Colors.transparent : secondaryColor))),
      child: Row(
        children: [
          Container(
            height: 70.w,
            width: 70.w,
            margin: EdgeInsets.only(right: kDefaultPaddingWidthWidget),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: secondaryColor),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ngày SALE THƯƠNG HIỆU !! Giảm giá có hạn',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle,
                ),
                Text(
                  '10 Th01 2022',
                  style: subTitleStyle.copyWith(height: 1.5.h),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
