import 'package:flutter/material.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/ui/screen/main/home/widget/deals/deals_item.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class FlashsaleVendorWidget extends StatelessWidget {
  const FlashsaleVendorWidget({Key? key, required this.listProduct})
      : super(key: key);
  final List<Product2> listProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Happenning',
            style: subHeadingStyle.copyWith(color: Colors.black),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: kDefaultPaddingHeightWidget),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listProduct.length,
            itemBuilder: (ctx, index) {
              final Product2 item = listProduct[index];
              return DealsItem(
                item: item,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
