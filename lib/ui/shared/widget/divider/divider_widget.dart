import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';

class DividerWidget extends StatelessWidget {
  final bool isSmall;
  const DividerWidget({Key? key, this.isSmall = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmall ? 0.5.h : 16.h,
      color: secondaryColor75,
    );
  }
}
