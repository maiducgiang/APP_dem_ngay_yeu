import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/shared/widget/header/heading.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Header(
                title: '',
                isBack: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthWidget),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                    height: 82.h,
                                    width: 82.h,
                                    margin: EdgeInsets.symmetric(
                                        vertical: kDefaultPaddingHeightWidget),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green[500]),
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 60.w,
                                    )),
                                Text(
                                  'Đặt hàng thành công',
                                  style: headingSuccessStyle,
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: kDefaultPaddingHeightScreen),
                                    child: Text(
                                      'Đã thanh toán! Đơn đặt hàng của bạn đang được thực hiện.',
                                      textAlign: TextAlign.center,
                                      style: headingStyle.copyWith(
                                          fontWeight: FontWeight.w300),
                                    )),
                              ],
                            ),
                            Heading(label: 'Chi tiết đơn hàng'),
                            Text(
                              'Mã vận đơn: 64484032',
                              style: titleStyle,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: kDefaultPaddingWidthScreen),
                              child: Text(
                                'Chi tiết và thông tin vận chuyển đơn hàng đã được gửi qua mail',
                                style: subTitleStyle.copyWith(height: 1.h),
                              ),
                            ),
                            Text(
                              'Đại chỉ nhận hàng:',
                              style: titleStyle,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: kDefaultPaddingWidthScreen),
                              child: Text(
                                'Mỹ Đình, Nam Từ Liêm, Hà Nội, 100000',
                                style: subTitleStyle.copyWith(height: 1.h),
                              ),
                            ),
                            Text(
                              'Phương thức thanh toán',
                              style: titleStyle,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: kDefaultPaddingWidthScreen),
                              child: Text(
                                'Ví VNPAY',
                                style: subTitleStyle.copyWith(height: 1.h),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // DividerWidget(),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: kDefaultPaddingWidthWidget),
                      //   child: Column(
                      //     children: [
                      //       const Heading(label: 'CHOCOCUOPLE'),
                      //       ListView.builder(
                      //         shrinkWrap: true,
                      //         physics: NeverScrollableScrollPhysics(),
                      //         itemBuilder: (context, index) {
                      //           return ProductOrderSuccessWidget(
                      //             isLast: index == 1,
                      //           );
                      //         },
                      //         itemCount: 2,
                      //       ),
                      //       Container(
                      //           margin: EdgeInsets.symmetric(
                      //               vertical: kDefaultPaddingHeightWidget),
                      //           child: OrderDetailWidget())
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              BaseBottom(
                onPressRight: () {
                  context.router.replace(MainPage());
                },
                onPressLeft: () {
                  context.router.replace(StatusOrderPage());
                },
                rightButton: 'Trang chủ',
                leftButton: 'Đơn mua',
              )
            ],
          ),
        ),
      ),
    );
  }
}
