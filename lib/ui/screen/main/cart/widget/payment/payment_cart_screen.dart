import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/checkbox/checkbox_widget.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/shared/widget/header/heading.dart';
import 'package:mubaha/ui/shared/widget/order_detail/order_detail_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class PaymentCartScreen extends StatefulWidget {
  PaymentCartScreen({Key? key}) : super(key: key);

  @override
  State<PaymentCartScreen> createState() => _PaymentCartScreenState();
}

class _PaymentCartScreenState extends State<PaymentCartScreen> {
  List discountList = [
    DiscountItem(),
    DiscountItem(),
    DiscountItem(),
    DiscountItem()
  ];

  late List firstDiscount;

  late List secondDiscount;
  bool isShow = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (discountList.length > 2) {
      firstDiscount = discountList.sublist(0, 1);
      secondDiscount = discountList.sublist(1, discountList.length);
    } else {
      firstDiscount = discountList;
      secondDiscount = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'Chi tiết đơn hàng',
              isBack: true,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: Column(
                      children: [
                        Heading(label: 'Ưu đãi khuyến mãi'),
                        secondDiscount.isEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return DiscountItem();
                                },
                                itemCount: discountList.length,
                              )
                            : Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return discountList[index];
                                    },
                                    itemCount: isShow
                                        ? firstDiscount.length +
                                            secondDiscount.length
                                        : firstDiscount.length,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isShow = !isShow;
                                        });
                                      },
                                      child: isShow
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  bottom:
                                                      kDefaultPaddingHeightScreen),
                                              child: Text(
                                                'Ẩn',
                                                style: subTitleStyle.copyWith(
                                                    color: primaryColor),
                                              ),
                                            )
                                          : Padding(
                                              padding: EdgeInsets.only(
                                                  bottom:
                                                      kDefaultPaddingHeightScreen),
                                              child: Stack(
                                                children: [
                                                  DiscountItem(),
                                                  Container(
                                                    height: 66.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: [
                                                          Colors.white,
                                                          Colors.white
                                                              .withOpacity(0.5)
                                                        ],
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          'Xem thêm',
                                                          style: subTitleStyle
                                                              .copyWith(
                                                                  color:
                                                                      primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                ],
                              )
                      ],
                    ),
                  ),
                  DividerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: Column(
                      children: const [
                        Heading(label: 'Phương thức thanh toán'),
                        MethodItem(
                          content: 'Thanh toán khi nhận hàng',
                          icon: Icons.money,
                          isSelect: true,
                        ),
                        MethodItem(
                            content: 'Thẻ tín dụng/Ghi nợ ',
                            icon: Icons.credit_card),
                        MethodItem(
                            content: 'Ví VNPAY',
                            icon: Icons.account_balance_wallet_outlined),
                        MethodItem(
                            content: 'Liên kết ngân hàng',
                            icon: Icons.phonelink_ring_rounded),
                      ],
                    ),
                  ),
                  DividerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: Column(
                      children: [
                        Heading(label: 'Chi tiết đơn hàng'),
                        const DividerWidget(
                          isSmall: true,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                vertical: kDefaultPaddingHeightWidget),
                            child: OrderDetailWidget())
                      ],
                    ),
                  ),
                ],
              ),
            )),
            BaseBottom(
                rightButton: 'MUA NGAY',
                isButton: false,
                price: '270.000đ',
                subTitle: 'Chi tiết',
                onPressRight: () => context.router.push(OrderSuccessPage()))
          ],
        ),
      ),
    );
  }
}

class MethodItem extends StatelessWidget {
  final bool isSelect;
  final String content;
  final IconData icon;
  const MethodItem(
      {Key? key,
      this.isSelect = false,
      required this.content,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPaddingWidthScreen),
      margin: EdgeInsets.only(bottom: kDefaultPaddingHeightWidget),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: secondaryColor45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              Text(
                content,
                style: titleStyle.copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
          CheckboxWidget(
            onPress: () {},
            isSelect: isSelect,
          )
        ],
      ),
    );
  }
}

class DiscountItem extends StatelessWidget {
  const DiscountItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: kDefaultPaddingHeightWidget),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPaddingWidthScreen,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: secondaryColor25),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Giảm tới 25% khi thanh toán VNPay',
        ),
      ),
    );
  }
}
