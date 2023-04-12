import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/shared/widget/header/heading.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class RuleScreen extends StatelessWidget {
  const RuleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'Điều khoản & điều kiện',
              isBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingWidthWidget),
                  child: Column(
                    children: [
                      Heading(label: 'Điều khoản và Điều kiện cho Muabaha'),
                      RuleItem(
                        ruleTitle: 'Giới thiệu',
                        ruleContent:
                            'Điều khoản và Điều kiện Chuẩn của Trang web này được viết trên trang web này sẽ quản lý việc bạn sử dụng trang web của chúng tôi, có thể truy cập nhiều phần tại www.mubaha.com.',
                      )
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

class RuleItem extends StatelessWidget {
  final String ruleTitle;
  final String ruleContent;
  const RuleItem({Key? key, required this.ruleTitle, required this.ruleContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ruleTitle,
          style: titleStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: kDefaultPaddingHeightScreen,
        ),
        Text(ruleContent,
            style: titleStyle.copyWith(
                fontWeight: FontWeight.w400, color: contentColor, height: 1.h))
      ],
    );
  }
}
