import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/vendor/vendor.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class VendorProductWidget extends StatelessWidget {
  const VendorProductWidget({Key? key, required this.vendor}) : super(key: key);
  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPaddingWidthScreen),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: kDefaultPaddingWidthWidget),
                height: 58.h,
                width: 58.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          vendor.avatar,
                        ),
                        fit: BoxFit.fill)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vendor.brandName,
                      style: categoryTitleStyle,
                    ),
                    Text(
                      'Online',
                      style: textCategoryNameStyle.copyWith(
                          color: contentColor, height: 1.5.h),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 12.h),
                        Text(
                          'Hà Nội',
                          style: textCategoryNameStyle.copyWith(
                              color: contentColor, height: 1.5.h),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => context.router.push(VendorPage(id: vendor.id)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingWidthScreen, vertical: 5.h),
                  decoration:
                      BoxDecoration(border: Border.all(color: primaryColor)),
                  child: Center(
                    child: Text(
                      'Xem shop',
                      style:
                          textCategoryNameStyle.copyWith(color: primaryColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
