import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/home/widget/deals/deals_item.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/product/product.dart';
import 'package:auto_route/auto_route.dart';

class DealsOfTheDay extends StatelessWidget {
  const DealsOfTheDay(
      {Key? key,
      required this.listProduct,
      this.showTitle = true,
      this.showAll = false})
      : super(key: key);
  final List<Product2> listProduct;
  final bool showTitle;
  final bool showAll;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen),
        margin: const EdgeInsets.only(bottom: kDefaultPaddingScreen),
        child: Column(
          children: [
            Visibility(
              visible: showTitle,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          LocaleKeys.deals_of_the_day.tr(),
                          style: headingStyle,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(Deal_of_the_day_detail(listProducts: listProduct, namePage: "Deal Of The Day"));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5.h),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingScreen),
                          child: Row(
                            children: [
                              Text(
                                LocaleKeys.view_all.tr()+" ",
                                style: subHeadingStyle.copyWith(
                                    fontSize: 11.sp, color: Colors.grey),
                              ),
                              // SizedBox(
                              //   width: kDefaultPaddingHeightScreen,
                              // ),
                              Container(
                                alignment: Alignment.center,
                                child: Icon(

                                    Icons.arrow_forward_ios,
                                  size: 13,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPaddingScreen.h,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: showAll
                    ? listProduct.length
                    : listProduct.length > 4
                        ? 4
                        : listProduct.length,
                itemBuilder: (ctx, index) {
                  final Product2 item = listProduct[index];
                  return DealsItem(
                    item: item,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
