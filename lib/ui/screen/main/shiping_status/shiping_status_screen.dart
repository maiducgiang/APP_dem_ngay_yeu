import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/enums/enum_shipment_type.dart';
import 'package:mubaha/data/model/shipment/shipment.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/screen/main/shiping_status/cubit/shiping_status_cubit.dart';
import 'package:mubaha/ui/screen/main/shiping_status/cubit/shiping_status_state.dart';
import 'package:mubaha/ui/shared/extension/format_date.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ShipingStatusScreen extends StatelessWidget {
  final String orderId;
  final String productImage;
  final int statusOrder;
  const ShipingStatusScreen(
      {Key? key,
      required this.orderId,
      required this.productImage,
      required this.statusOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ShipingStatusCubit(getIt.get<CustomerRepository>())
          ..getProductDetail(orderId),
        child: BlocConsumer<ShipingStatusCubit, ShipingStatusState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.isLoading) return LoadingScreen();
            return SafeArea(
                child: Column(
              children: [


                Header(
                  isBack: true,
                  title: statusOrder == 2 ? 'Đang giao' : 'Hoàn thành',
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const DividerWidget(),
                      Container(
                        padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    right: kDefaultPaddingWidthWidget),
                                height: 50.w,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          productImage,
                                        ),
                                        fit: BoxFit.cover))),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: statusOrder == 2
                                                ? 'Đã lấy hàng vào '
                                                : 'Đã giao vào ',
                                            style: titleStyle),
                                        TextSpan(
                                            text: FormatDayShip(state
                                                        .shipmentData!
                                                        .proccessingInfo
                                                        .deliveredAt ??
                                                    state
                                                        .shipmentData!
                                                        .proccessingInfo
                                                        .intransitAt!)
                                                .format(),
                                            style: titleStyle.copyWith(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w400)),
                                      ])),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Vận chuyển ' +
                                        (state.shipmentData!.shipmentMethod
                                                    .type ==
                                                ShipmentType.express
                                            ? 'hoả tốc'
                                            : 'nhanh') +
                                        ' - ' +
                                        state.shipmentData!.shipmentMethod.name,
                                    style: subTitleStyle.copyWith(
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const DividerWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthWidget,
                            vertical: kDefaultPaddingHeightScreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Mã vận đơn',
                              style: titleStyle,
                            ),
                            Text(
                              state.shipmentData!.shipment.shipmentId,
                              style: titleStyle,
                            )
                          ],
                        ),
                      ),
                      const DividerWidget(
                        isSmall: true,
                      ),
                      StepShipingItem(
                        shipment: state.shipmentData!.shipment,
                      )
                    ],
                  ),
                ))
              ],
            ));
          },
        ),
      ),
    );
  }
}

class StepShipingItem extends StatelessWidget {
  final Shipment shipment;
  const StepShipingItem({Key? key, required this.shipment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: shipment.details.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          FormatDateShip(shipment.details[index].processedAt)
                              .format(),
                          style: index == 0
                              ? titleStyle.copyWith(fontWeight: FontWeight.w300)
                              : subTitleStyle,
                        ),
                        Text(
                          FormatTime(shipment.details[index].processedAt)
                              .format(),
                          style: index == 0
                              ? titleStyle.copyWith(fontWeight: FontWeight.w300)
                              : subTitleStyle,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 30.w,
                                  child: Container(
                                    width: 10.w,
                                    height: 10.w,
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? Colors.green
                                            : secondaryColor,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shipment.details[index].title,
                                        style: index != 0
                                            ? subTitleStyle.copyWith(
                                                height: 1.2)
                                            : titleStyle.copyWith(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w300,
                                                height: 1.2),
                                      ),
                                      Text(
                                        shipment.details[index].note ?? '',
                                        style: index != 0
                                            ? subTitleStyle.copyWith(
                                                height: 1.2)
                                            : titleStyle.copyWith(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w300,
                                                height: 1.2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 30.w,
                              child: Container(
                                width: 10.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? Colors.green
                                        : secondaryColor,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Visibility(
                                visible: index < shipment.details.length - 1,
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 1.w,
                                    height: 40.h,
                                    color: secondaryColor,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
