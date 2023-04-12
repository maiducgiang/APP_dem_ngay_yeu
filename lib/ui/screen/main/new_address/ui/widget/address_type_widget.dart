import 'package:flutter/material.dart';
import 'package:mubaha/ui/shared/widget/checkbox/checkbox_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class AddressTypeWidget extends StatelessWidget {
  final bool isSelect;
  final String title;
  const AddressTypeWidget(
      {Key? key, this.isSelect = false, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckboxWidget(
          onPress: () {},
          isSelect: isSelect,
        ),
        SizedBox(
          width: kDefaultPaddingWidthScreen,
        ),
        Text(
          title,
          style: titleStyle.copyWith(color: contentColor),
        )
      ],
    );
  }
}
