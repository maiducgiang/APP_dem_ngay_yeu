import 'package:flutter/material.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProductDescWidget extends StatelessWidget {
  const ProductDescWidget({Key? key, required this.desc}) : super(key: key);
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DescItem(title: 'Mô tả sản phẩm', subTitle: desc),
            // SizedBox(
            //   height: kDefaultPaddingHeight,
            // ),
            // const DescItem(
            //     title: 'Sample measurements',
            //     subTitle:
            //         'Female model is 1m67 tall, weighs 48kg, wears US size'),
            // SizedBox(
            //   height: kDefaultPaddingHeight,
            // ),
            // const DescItem(title: 'Material', subTitle: '100% cotton'),
            // SizedBox(
            //   height: kDefaultPaddingHeight,
            // ),
            // const DescItem(title: 'Product code', subTitle: '460356366')
          ],
        ));
  }
}

class DescItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const DescItem({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: subHeadingStyle.copyWith(color: titleColor),
        ),
        SizedBox(
          height: kDefaultPaddingHeightScreen,
        ),
        Text(
          subTitle,
          style: subHeadingStyle.copyWith(
              color: contentColor, fontWeight: FontWeight.w400, height: 1.3),
        ),
      ],
    );
  }
}
