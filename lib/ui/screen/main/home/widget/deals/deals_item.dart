import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class DealsItem extends StatelessWidget {
  const DealsItem({Key? key, required this.index, required this.item})
      : super(key: key);
  final int index;
  final Product2 item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductDetailPage(id: item.id));
      },
      child: Container(
        margin: EdgeInsets.only(top: index > 0 ? kDefaultPaddingScreen.w : 0),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: backgroundItemColor.withOpacity(0.35),
          boxShadow: [
            BoxShadow(
                color: backgroundItemColor.withOpacity(0.35),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: const Offset(0, 1))
          ],
          borderRadius: BorderRadius.circular(kDefaultBorderRadius.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        item.media.featuredImage,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius.r)),
            ),
            SizedBox(width: kDefaultPaddingScreen.w),
            Expanded(
                child: Container(
              padding: EdgeInsets.zero,
              height: 90.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: titleStyle.copyWith(fontSize: 15.sp),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  // Text(
                  //   item.name,
                  //   style: subTitleStyle,
                  //   maxLines: 1,
                  // ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Visibility(
                      visible: item.price == 0,
                      child: Text(
                        item.price.toString(),
                        style: titleStyle.copyWith(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      )),
                  Visibility(
                      visible: item.price != 0,
                      child: RichText(
                        text: TextSpan(
                          text: item.getCurentPrice.toString(),
                          style: titleStyle.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            const TextSpan(text: "  "),
                            TextSpan(
                                text: '${item.getPrice}',
                                style: subTitleStyle.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough)),
                            const TextSpan(text: " "),
                            TextSpan(
                                text: ' ${(item.discount * 100).toInt()}%',
                                style: titleStyle.copyWith(
                                    fontSize: 13.sp,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
                ],
              ),
            )),
            SizedBox(width: kDefaultPaddingScreen.w),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 6.h),
              width: 20.w,
              height: 20.w,
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white),
              child: Icon(
                Ionicons.heart_outline,
                color: Colors.grey[600],
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
