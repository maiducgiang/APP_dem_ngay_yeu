import 'package:flutter/material.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PriceItem(leftText: 'Tổng tiền hàng', rightText: '220.000đ'),
        const PriceItem(
          leftText: 'Giảm giá',
          rightText: '-20.000đ',
          isDiscount: true,
        ),
        const PriceItem(
          leftText: 'Phiếu giảm giá',
          rightText: 'Áp dụng',
          isApply: true,
        ),
        const PriceItem(leftText: 'Phí vận chuyển', rightText: '50.000đ'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPaddingWidthWidget),
          child: const DividerWidget(
            isSmall: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Thành tiền',
              style: subTitleStyle.copyWith(height: 1.5, color: titleColor),
            ),
            Text('250.000đ',
                style: subTitleStyle.copyWith(height: 1.5, color: titleColor))
          ],
        ),
      ],
    );
  }
}

class PriceItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  final bool isDiscount;
  final bool isApply;
  const PriceItem(
      {Key? key,
      required this.leftText,
      required this.rightText,
      this.isApply = false,
      this.isDiscount = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: subTitleStyle.copyWith(height: 1.5),
        ),
        Text(rightText,
            style: subTitleStyle.copyWith(
                height: 1.5,
                color: isDiscount
                    ? Colors.green
                    : isApply
                        ? Colors.red
                        : null))
      ],
    );
  }
}
