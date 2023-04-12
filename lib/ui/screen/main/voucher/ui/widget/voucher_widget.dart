import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/enums/enum_voucher_type.dart';
import 'package:mubaha/data/model/voucher/voucher.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class VoucherWidget extends StatelessWidget {
  final bool isLast;

  final bool isSelect;
  final VoucherDocs voucherDocs;
  const VoucherWidget(
      {Key? key,
      this.isLast = false,
      required this.voucherDocs,
      this.isSelect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPaddingHeight),
      padding: EdgeInsets.only(bottom: kDefaultPaddingHeight),
      decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(bottom: BorderSide(color: secondaryColor))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    voucherDocs.title,
                    style: titleStyle,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: kDefaultPaddingWidthScreen),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: secondaryColor45,
                        borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      voucherDocs.code,
                      style: subTitleStyle,
                    ),
                  ),
                ],
              ),
              Text(
                isSelect ? 'ĐÃ ÁP DỤNG' : 'ÁP DỤNG',
                style: titleStyle.copyWith(color: primaryColor),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 7.h),
              padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 3.h),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: Text(
                'Đơn hàng từ ' + voucherDocs.getMinBasketPrice!,
                style: subTitleStyle.copyWith(color: Colors.green),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 7.h),
              padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 3.h),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: Text(
                'Giảm đến ' +
                    (voucherDocs.discount.type == VoucherType.percent
                        ? (voucherDocs.getPercentDiscount! +
                            ' tối đa ' +
                            (voucherDocs.getMaxVoucherAmount!))
                        : voucherDocs.getPriceDiscount!),
                style: subTitleStyle.copyWith(color: Colors.green),
              )),
          Text(
            'Hạn sử dụng: ' + voucherDocs.getStartDate!,
            style: subTitleStyle,
          ),
        ],
      ),
    );
  }
}
