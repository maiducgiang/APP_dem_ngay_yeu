import 'dart:developer';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/screen/main/home/widget/style/product_primary_item.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/product/product.dart';

import 'package:provider/src/provider.dart';

class KidCorner extends StatelessWidget {
  const KidCorner({
    Key? key,
    required this.listKidsConner,
  }) : super(key: key);
  final List<Product2> listKidsConner;
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
                LocaleKeys.your_style.tr(),
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              padding: EdgeInsets.zero,
              child: Text(
                LocaleKeys.summer_sale.tr(),
                style: subHeadingStyle,
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
                  scrollDirection: Axis.horizontal,
                  itemCount: listKidsConner.length,
                  itemBuilder: (ctx, index) {
                    final Product2 item = listKidsConner[index];
                    return ProductPrimaryItem(
                        index: index,
                        product: item,
                        isHorizontal: true,
                        maxWidth: (MediaQuery.of(context).size.width -
                                kDefaultPaddingScreen.w * 3.w) *
                            0.46);
                  },
                ))
          ],
        ));
  }
}
