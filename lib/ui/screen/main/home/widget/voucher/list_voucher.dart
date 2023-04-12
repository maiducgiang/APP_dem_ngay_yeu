import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/voucher/voucher.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ListVoucher extends StatelessWidget {
  const ListVoucher({Key? key, this.listVoucher}) : super(key: key);
  final List<Voucher>? listVoucher;
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
            "Ưu đãi",
            style: headingStyle,
          ),
          GridView.builder(
            padding: EdgeInsets.only(top: kDefaultPaddingScreen.h),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              mainAxisSpacing: kDefaultPaddingScreen.w,
              crossAxisSpacing: kDefaultPaddingScreen.w,
            ),
            itemCount: listVoucher!.length > 4 ? 4 : listVoucher!.length,
            itemBuilder: (context, index) {
              final Voucher item = listVoucher![index];
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    border: Border.all(color: secondaryColor, width: 1.w),
                    borderRadius:
                        BorderRadius.circular(kDefaultBorderRadius.r)),
                child: Text(
                  item.message,
                  style: titleStyle,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
