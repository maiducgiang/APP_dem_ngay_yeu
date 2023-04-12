import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/screen/main/home/widget/style/product_primary_item.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class RelatedProductWidget extends StatelessWidget {
  const RelatedProductWidget({Key? key, required this.relatedProducts})
      : super(key: key);
  final List<Product2> relatedProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
          child: Text(
           LocaleKeys.related_product.tr(),
            style: subHeadingStyle.copyWith(color: titleColor),
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: 210.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: relatedProducts.length,
              itemBuilder: (ctx, index) {
                final Product2 item = relatedProducts[index];
                return ProductPrimaryItem(
                    index: index,
                    product: item,
                    isHorizontal: true,
                    maxWidth: (MediaQuery.of(context).size.width -
                            kDefaultPaddingScreen.w * 3.w) *
                        0.46);
              },
            )),
      ],
    );
  }
}
