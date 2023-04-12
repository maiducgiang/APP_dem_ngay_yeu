import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';

class RegistrationBase extends StatelessWidget {
  Widget customWidget;
  RegistrationBase({Key? key, required this.customWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.only(top: kDefaultPaddingScreen),
        child: Stack(
          children: [
            Positioned(
                top: -256.h,
                right: -127.w,
                child: Container(
                  height: 400.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                      color: partBackgroundColor, shape: BoxShape.circle),
                )),
            SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppPath.logoPng,
                          width: 117.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.router.push(MainPage());
                          },
                          child: Text(
                            'Bỏ qua',
                            style: AppTextStyle().textSemi16,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: customWidget,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
