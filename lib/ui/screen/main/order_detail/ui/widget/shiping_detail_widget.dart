import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/enums/enum_shipment_type.dart';
import 'package:mubaha/data/model/order/order.dart';
import 'package:mubaha/ui/shared/extension/format_date.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ShippingDetailWidget extends StatelessWidget {
  final int? statusOrder;
  final OrderShipmentMethod shipmentMethod;
  final OrderProccessingInfo proccessingInfo;
  const ShippingDetailWidget(
      {Key? key,
      required this.shipmentMethod,
      required this.proccessingInfo,
      this.statusOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
              vertical: kDefaultPaddingHeightScreen),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20.w,
                    child: const Icon(
                      Icons.local_shipping_outlined,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPaddingWidthWidget,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin vận chuyển',
                        style: titleStyle,
                      ),
                      Row(
                        children: [
                          Text(
                              shipmentMethod.type == ShipmentType.express
                                  ? 'Hoả tốc'
                                  : 'Nhanh',
                              style: subTitleStyle.copyWith(height: 1.5)),
                        ],
                      ),
                      Text(shipmentMethod.name,
                          style: subTitleStyle.copyWith(height: 1.5)),
                    ],
                  )),
                  SizedBox(
                    width: kDefaultPaddingWidthWidget,
                  ),
                ],
              ),
              proccessingInfo.deliveredAt != null ||
                      proccessingInfo.intransitAt != null
                  ? Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              width: 20.w,
                              child: Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 10.sp,
                              ),
                            ),
                            SizedBox(
                              width: kDefaultPaddingWidthWidget,
                            ),
                            Text(
                              statusOrder == 3
                                  ? 'Giao hàng thành công'
                                  : 'Thời gian lấy hàng',
                              style: subTitlePrimaryColorStyle.copyWith(
                                  color: Colors.green, height: 1.5),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: kDefaultPaddingWidthWidget + 20.w,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    FormatDate2(proccessingInfo.deliveredAt ??
                                            proccessingInfo.intransitAt!)
                                        .format(),
                                    style: subTitleStyle.copyWith(height: 1.5)),
                              ],
                            )),
                            SizedBox(
                              width: kDefaultPaddingWidthWidget,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Container(),
            ],
          )),
    );
  }
}
