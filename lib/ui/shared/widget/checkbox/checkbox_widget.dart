import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';

class CheckboxWidget extends StatelessWidget {
  final bool isSelect;
  final bool isCircle;
  final VoidCallback? onPress;
  const CheckboxWidget(
      {Key? key, this.isSelect = false, this.isCircle = true, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: kDefaultPaddingWidthWidget,
        width: kDefaultPaddingWidthWidget,
        decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            color: isSelect ? primaryColor : Colors.white,
            border:
                Border.all(color: isSelect ? Colors.transparent : Colors.grey)),
        child: Icon(
          isCircle ? Icons.circle : Icons.done,
          size: isCircle ? 8.w : kDefaultPaddingWidthWidget,
          color: isSelect ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}
