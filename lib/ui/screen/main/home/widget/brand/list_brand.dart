import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/brand/brand.dart';

class ListBrand extends StatelessWidget {
  const ListBrand({Key? key, required this.listBrand}) : super(key: key);
  final List<Brand> listBrand;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ưu đãi thương hiệu hàng đầu",
            style: headingStyle,
          ),
          SizedBox(
            height: kDefaultPaddingScreen.h,
          ),
          Container(
            padding: EdgeInsets.zero,
            height: 60.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listBrand.length,
              itemBuilder: (ctx, index) {
                final Brand item = listBrand[index];
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingScreen.w),
                    margin: EdgeInsets.only(right: kDefaultPaddingScreen.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor, width: 1.w),
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                            visible: item.media != null,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxHeight: 50,
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.35),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          item.media!.featuredImage),
                                      fit: BoxFit.contain)),
                            )),
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
