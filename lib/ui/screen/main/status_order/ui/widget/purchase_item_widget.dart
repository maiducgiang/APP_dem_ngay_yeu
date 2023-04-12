import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/shared/widget/rating/rating_widget.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class PurchaseItemWidget extends StatelessWidget {
  final bool isInfor;
  const PurchaseItemWidget({Key? key, this.isInfor = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 80.h,
                    width: 80.h,
                    margin: EdgeInsets.only(right: kDefaultPaddingWidthScreen),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pink Hoodie t-shirt full',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleStyle,
                        ),
                        Text(
                          'Size: S, SL: 01',
                          style: subTitlePrimaryColorStyle.copyWith(
                              color: contentColor, height: 1.2.sp),
                        ),
                        Text(
                          'Xem chi tiết',
                          style: subTitlePrimaryColorStyle.copyWith(
                              color: Colors.green, height: 1.2.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              margin: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(
                  color: isInfor ? primaryColor : secondaryColor,
                  borderRadius: BorderRadius.circular(3)),
              child: Center(
                  child: Text(
                isInfor ? 'Đã giao hàng' : 'Đang giao',
                style: isInfor
                    ? titleStyle.copyWith(color: Colors.white)
                    : titleStyle,
              )),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: kDefaultPaddingWidthWidget),
          height: 60.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
          child: Stack(
            children: [
              Container(
                height: 60.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(3)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.asset(
                      AppPath.map,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Colors.white.withOpacity(0.33)]),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ngày đặt hàng',
                          style: subTitleStyle,
                        ),
                        Text(
                          '24 TH01 2022',
                          style: TextStyle(height: 1.5.sp),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: kDefaultPaddingWidthWidget),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trạng thái đơn hàng',
                            style: subTitleStyle,
                          ),
                          Text(
                            'Đang giao, đợi người nhận xác nhận',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(height: 1.5.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        isInfor ? RatingWidget() : SizedBox()
      ],
    );
  }
}
