import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class AddressItemWidget extends StatelessWidget {
  final AddressDataResponse addressData;
  final bool isPayment;
  final bool isOrderDetail;
  const AddressItemWidget(
      {Key? key,
      required this.addressData,
      this.isPayment = true,
      this.isOrderDetail = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
              vertical: kDefaultPaddingHeightScreen),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: primaryColor,
              ),
              SizedBox(
                width: kDefaultPaddingWidthWidget,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: isOrderDetail,
                    child: Text(
                      'Địa chỉ nhận hàng',
                      style: titleStyle,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        addressData.fullName,
                        style: isOrderDetail
                            ? subTitleStyle.copyWith(height: 1.5)
                            : titleStyle,
                      ),
                    ],
                  ),
                  Text(addressData.phone,
                      style: isOrderDetail
                          ? subTitleStyle.copyWith(height: 1.5)
                          : subTitleStyle.copyWith(
                              height: 1.5, color: Colors.black)),
                  Text(
                    addressData.fullAddress,
                    style: subTitleStyle.copyWith(height: 1.5),
                  ),
                ],
              )),
              SizedBox(
                width: kDefaultPaddingWidthWidget,
              ),
              Visibility(
                visible: isPayment,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15.sp,
                ),
              ),
            ],
          )),
    );
  }
}
