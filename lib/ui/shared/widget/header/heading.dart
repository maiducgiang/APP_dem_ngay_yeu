import 'package:flutter/material.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class Heading extends StatelessWidget {
  final String label;
  final bool? paddingBottom;
  final bool isH2;
  const Heading(
      {Key? key,
      required this.label,
      this.paddingBottom = true,
      this.isH2 = false})
      : super(key: key);
  const Heading.h2(
      {Key? key,
      required this.label,
      this.paddingBottom = true,
      this.isH2 = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: kDefaultPaddingHeightWidget,
          bottom: paddingBottom == true ? kDefaultPaddingHeightWidget : 0),
      child: Text(
        label,
        style: isH2 ? titleStyle : headingStyle,
      ),
    );
  }
}
