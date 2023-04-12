import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/data/model/product/product.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class SecondaryItem extends StatelessWidget {
  const SecondaryItem(
      {Key? key,
      required this.index,
      required this.item,
      required this.listCount})
      : super(key: key);
  final int index;
  final Product item;
  final int listCount;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductDetailPage(id: item.id));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: backgroundItemColor.withOpacity(0.35),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: const Offset(0, 1))
          ],
          borderRadius: BorderRadius.circular(kDefaultBorderRadius.r),
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            item.media!.featuredImage,
                          ),
                          fit: BoxFit.cover),
                      borderRadius:
                          BorderRadius.circular(kDefaultBorderRadius.r)),
                ),
                SizedBox(width: kDefaultPaddingScreen.w),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.zero,
                  height: 100.w,
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
                      Text(
                        item.vendorName ?? "",
                        style: subTitleStyle,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Visibility(
                          visible: item.discountPercent == '0',
                          child: Text(
                            item.getPrice ?? "",
                            style: titleStyle.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w400),
                          )),
                      Visibility(
                          visible: item.discountPercent != '0',
                          child: RichText(
                            text: TextSpan(
                              text: item.priceAfterDiscount ?? "",
                              style: titleStyle.copyWith(
                                  fontSize: 15.sp, fontWeight: FontWeight.w400),
                              children: <TextSpan>[
                                const TextSpan(text: "  "),
                                TextSpan(
                                    text: '${item.getPrice}',
                                    style: subTitleStyle.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        decoration:
                                            TextDecoration.lineThrough)),
                                const TextSpan(text: " "),
                                TextSpan(
                                    text: ' ${item.discountPercent}%',
                                    style: titleStyle.copyWith(
                                        fontSize: 15.sp,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          )),
                      SizedBox(height: 5.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 6.h),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: backgroundItemColor, width: 1))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 6.w),
                                  margin: EdgeInsets.only(bottom: 4.h),
                                  child: SvgPicture.asset(
                                    AppPath.cartIcon,
                                    color: Colors.black,
                                    width: 13.w,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "Thêm vào giỏ hàng",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                "|",
                                style: subTitleStyle,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(right: 6.w),
                                    margin: EdgeInsets.only(bottom: 5.h),
                                    child: Icon(
                                      Ionicons.trash_outline,
                                      size: 13.sp,
                                    )),
                                Container(
                                  padding: EdgeInsets.zero,
                                  // margin: EdgeInsets.only(top: 5.h),
                                  child: Text(
                                    "Xoá",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
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
          Visibility(
              visible: index != listCount - 1, child: const DividerWidget())
        ]),
      ),
    );
  }
}
