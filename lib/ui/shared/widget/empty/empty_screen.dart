import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? buttonTitle;
  const EmptyScreen(
      {Key? key, required this.title, this.subTitle, this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.h),
          height: 200.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppPath.mubahaNoOrder))),
        ),
        // Padding(
        //     padding:
        //         EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
        //     child: Image.asset(
        //       AppPath.mubahaNoOrder,
        //     )),
        SizedBox(
          height: kDefaultPaddingWidthWidget,
        ),
        Text(
          title,
          style: headerTitleStyle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPaddingWidthScreen),
          child: Text(
            subTitle ?? '',
            textAlign: TextAlign.center,
            style: subHeadingStyle.copyWith(color: contentColor),
          ),
        ),
        Visibility(
            visible: buttonTitle != null,
            child: PrimaryButton(label: buttonTitle ?? ''))
      ],
    );
  }
}
