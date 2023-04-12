import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProductPrimaryItem extends StatelessWidget {
  const ProductPrimaryItem(
      {Key? key,
      required this.product,
      required this.index,
      this.maxWidth,
      this.isHorizontal = false})
      : super(key: key);
  final int index;
  final Product2 product;
  final double? maxWidth;
  final bool? isHorizontal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductDetailPage(id: product.id));
      },
      child: Container(
        width: maxWidth ??
            (MediaQuery.of(context).size.width - kDefaultPaddingScreen.w * 3) /
                2,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(
            right: isHorizontal == true ? kDefaultPaddingScreen.w : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: maxWidth ??
                  (MediaQuery.of(context).size.width -
                          kDefaultPaddingScreen.w * 3) /
                      2,
              height: maxWidth ??
                  (MediaQuery.of(context).size.width -
                          kDefaultPaddingScreen.w * 3) /
                      2,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset: const Offset(0, 1))
                  ],
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        product.media.featuredImage,
                      ),
                      fit: BoxFit.contain)),
              child: Stack(
                children: [
                  Positioned(
                      top: 6.h,
                      right: 6.w,
                      child: Container(
                        alignment: Alignment.center,
                        width: 20.w,
                        height: 20.w,
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Icon(
                          Ionicons.heart_outline,
                          color: Colors.grey[600],
                          size: 16.sp,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: kDefaultPaddingScreen.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    height: 15.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (ctx, index) {
                        return Container(
                            padding: const EdgeInsets.all(0),
                            margin: EdgeInsets.only(right: 5.w),
                            child: Icon(Icons.star,
                                color: index < 4 ? primaryColor : Colors.grey,
                                size: 15.sp));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    product.name,
                    style: titleStyle.copyWith(fontSize: 15.sp),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Visibility(
                      visible: product.price == 0,
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Text(
                        product.getPrice ?? "",
                        style: titleStyle.copyWith(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      )),
                  Visibility(
                      visible: product.price != 0,
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      child: RichText(
                        text: TextSpan(
                          text: product.getCurentPrice ?? "",
                          style: titleStyle.copyWith(
                              fontSize: 13.sp, fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            const TextSpan(text: "  "),
                            TextSpan(
                                text: '${product.getPrice}',
                                style: subTitleStyle.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
