import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/ui/screen/main/home/widget/style/product_primary_item.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:mubaha/data/model/product/product.dart';

class ListSimilatProduct extends StatelessWidget {
  const ListSimilatProduct({Key? key, required this.listProduct})
      : super(key: key);
  final List<Product2> listProduct;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen),
        margin: const EdgeInsets.symmetric(vertical: kDefaultPaddingScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: Text(
                "Có thể bạn cũng thích",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: kDefaultPaddingScreen.h,
            ),
            Container(
                alignment: Alignment.centerLeft,
                height: 210.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: listProduct.length,
                  itemBuilder: (ctx, index) {
                    final Product2 item = listProduct[index];
                    return ProductPrimaryItem(
                        index: index,
                        product: item,
                        isHorizontal: true,
                        maxWidth: (MediaQuery.of(context).size.width -
                                kDefaultPaddingScreen.w * 3) *
                            0.46);
                  },
                ))
          ],
        ));
  }
}
