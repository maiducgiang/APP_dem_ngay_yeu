import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -274.h,
        right: -213.w,
        child: Container(
          height: 400.h,
          width: 400.w,
          decoration:
              BoxDecoration(color: partBackgroundColor, shape: BoxShape.circle),
        ));
  }
}
