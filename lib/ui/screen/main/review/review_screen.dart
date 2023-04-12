import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/ui/screen/main/review/widget/review_item.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ReviewScreen extends StatelessWidget {
  final List<CartDocs> cartDocs;
  const ReviewScreen({Key? key, required this.cartDocs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          minimum: EdgeInsets.only(bottom: 8.h),
          child: Column(
            children: [
              const Header(
                isBack: true,
                title: 'Đánh giá sản phẩm',
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DividerWidget(),
                    Padding(
                      padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
                            height: 170.h,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Giao hàng thành công!',
                                        style: headingSuccessStyle.copyWith(
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                          'Đơn hàng đã được giao thành công ngày:',
                                          style: subTitleStyle.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12.sp)),
                                      Text('13/6/2022',
                                          style: subTitleStyle.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              height: 1.3))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                    height: 120.h,
                                    child: Image.asset(AppPath.orderSuccess))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPaddingWidthWidget,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cartDocs.length,
                              itemBuilder: ((context, index) {
                                return ReviewItem(
                                  cartDocs: cartDocs[index],
                                );
                              }))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                height: 57.h,
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: baseBottom))),
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthWidget,
                ),
                child: Center(child: PrimaryButton(label: 'Xác nhận')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
