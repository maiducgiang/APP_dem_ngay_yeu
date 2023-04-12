import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/screen/main/home/widget/style/product_primary_item.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class YourStyle extends StatelessWidget {
  const YourStyle(
      {Key? key,
      required this.listYourStyle,
      // required this.listStyleType,
      required this.categoryIndex,
      this.showTitle = true})
      : super(key: key);
  final List<Product2> listYourStyle;
  // final List<String> listStyleType;
  final int categoryIndex;
  final bool showTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen),
        margin: const EdgeInsets.symmetric(vertical: kDefaultPaddingScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: showTitle,
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
                  SizedBox(
                    height: kDefaultPaddingScreen.h,
                  ),
                ],
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.only(top: kDefaultPaddingScreen.h),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: kDefaultPaddingScreen.w,
                crossAxisSpacing: kDefaultPaddingScreen.w,
              ),
              itemCount: listYourStyle.length > 6 ? 6 : listYourStyle.length,
              itemBuilder: (context, index) {
                final Product2 item = listYourStyle[index];
                return ProductPrimaryItem(
                  index: index,
                  product: item,
                );
              },
            )
          ],
        ));
  }
}
