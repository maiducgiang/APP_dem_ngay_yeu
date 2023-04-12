import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:auto_route/auto_route.dart';

class CustomRichtext extends StatelessWidget {
  final String textSpan1;
  final String textSpan2;
  final dynamic widgetNavigator;

  const CustomRichtext(
      {Key? key,
      required this.textSpan1,
      required this.textSpan2,
      required this.widgetNavigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(style: AppTextStyle().textBody, children: [
        TextSpan(text: textSpan1),
        TextSpan(
            text: textSpan2,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.push(widgetNavigator);
              },
            style: AppTextStyle().textBody.copyWith(
                color: Colors.black, decoration: TextDecoration.underline))
      ])),
    );
  }
}
