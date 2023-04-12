import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/screen/main/other/help/ui/widget/help_item_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/shared/widget/header/heading.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'Trung tâm trợ giúp',
              isBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingWidthWidget),
                  child: Column(
                    children: [
                      Container(
                        height: 146.h,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Heading.h2(label: 'Trung tâm trợ giúp'),
                      Text(
                          'Vui lòng liên hệ và chúng tôi sẽ sẵn lòng trợ giúp bạn. Nhận hỗ trợ khách hàng nhanh chóng bằng cách chọn mặt hàng của bạn',
                          style: titleStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: contentColor,
                              height: 1.h)),
                      Heading.h2(label: 'Những vấn đề bạn gặp phải'),
                      HelpItemWidget(),
                      HelpItemWidget(),
                      HelpItemWidget(),
                      HelpItemWidget()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
