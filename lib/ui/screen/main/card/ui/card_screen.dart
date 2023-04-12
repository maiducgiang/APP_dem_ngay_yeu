import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/screen/main/card/ui/widget/wallet_item_widget.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/shared/widget/header/heading.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:mubaha/translations/locale_keys.g.dart';

class CardScreen extends StatelessWidget {
  CardScreen({Key? key}) : super(key: key);

  final CarouselController _slideController = CarouselController();
  final List<String> imgList = [
    AppPath.splash2,
    AppPath.splash2,
    AppPath.splash3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              isBack: true,
              title: LocaleKeys.payment.tr(),
            ),

            DividerWidget(
              isSmall: true,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: Heading(
                      label: LocaleKeys.saved_card.tr(),
                      paddingBottom: false,
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        enableInfiniteScroll: false, viewportFraction: 1),
                    carouselController: _slideController,
                    items: [1, 2].map((i) {
                      return CreditCardWidget(
                        cardBgColor: primaryColor,
                        cardNumber: '2141241412412',
                        expiryDate: '54645',
                        cardHolderName: '53773',
                        cvvCode: '004',
                        showBackView: false,
                        onCreditCardWidgetChange: (_) {},
                        isSwipeGestureEnabled: false,
                        isChipVisible: true,
                      );
                    }).toList(),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: kDefaultPaddingWidthWidget,
                          right: kDefaultPaddingWidthWidget,
                          bottom: kDefaultPaddingHeight),
                      child: Row(
                        children: [
                          Expanded(
                            child: PrimaryButton.noBorder(
                                label: 'Xoá',
                                paddingHeight: 8.h,
                                backgroundColor: secondaryColor,
                                style: const TextStyle(color: Colors.black)),
                          ),
                          SizedBox(width: kDefaultPaddingWidthScreen),
                          Expanded(
                            child: PrimaryButton.noBorder(
                                label: 'Chỉnh sửa',
                                paddingHeight: 8.h,
                                backgroundColor: secondaryColor,
                                style: const TextStyle(color: Colors.black)),
                          ),
                        ],
                      )),
                  DividerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: const Heading(label: 'Ví liên kết'),
                  ),
                  WalletItemWidget()
                ],
              ),
            )),
            BaseBottom(
              leftButton: 'Quay lại',
              rightButton: 'Thêm thẻ mới',
            )
          ],
        ),
      ),
    );
  }
}
