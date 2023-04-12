import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPaddingWidthWidget),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Icon(
                Icons.star_border_outlined,
                size: 15.w,
                color: Colors.grey[500],
              ),
              Text(
                'Đánh giá sản phẩm',
                style: subTitleStyle,
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Icon(
                Icons.phone,
                size: 15.w,
                color: Colors.grey[500],
              ),
              Text(
                'Liên hệ shop',
                style: subTitleStyle,
              )
            ],
          )),
        ],
      ),
    );
  }
}
