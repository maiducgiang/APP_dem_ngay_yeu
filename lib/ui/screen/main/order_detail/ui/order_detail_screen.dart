import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/order/order.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/cart.dart';
import 'package:mubaha/ui/screen/main/order_detail/ui/widget/reason_delete_widget.dart';
import 'package:mubaha/ui/screen/main/order_detail/ui/widget/shiping_detail_widget.dart';
import 'package:mubaha/ui/screen/main/status_order/cubit/status_order_cubit.dart';
import 'package:mubaha/ui/screen/main/status_order/cubit/status_order_state.dart';
import 'package:mubaha/ui/shared/extension/format_date.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/address/address_item_widget.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class OrderDetailScreen extends StatelessWidget {
  final List<CartDocs> cartDocs;
  final String orderId;
  final bool isPayment;
  final int? statusOrder;
  final Function(String id, int statusIndex)? onBack;
  OrderDetailScreen(
      {Key? key,
      required this.orderId,
      this.isPayment = true,
      this.onBack,
      this.statusOrder,
      required this.cartDocs})
      : super(key: key);

  void reasonDelete(
      {required BuildContext context, Function(String reason)? onBack}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ReasonDeleteWidget(
          onBack: (String reason) async {
            onBack!.call(reason);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => StatusOrderCubit(getIt.get<CustomerRepository>())
          ..getOrderDetail(orderId),
        child: BlocConsumer<StatusOrderCubit, StatusOrderState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.isLoading) return LoadingScreen();
            final OrderDocs orderDocs = state.orderDocs!;
            return SafeArea(
                bottom: false,
                minimum: EdgeInsets.only(bottom: 8.h),
                child: Column(
                  children: [
                    const Header(
                      isBack: true,
                      title: 'Thông tin đơn hàng',
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                      children: [
                        const DividerWidget(
                          isSmall: true,
                        ),
                        GestureDetector(
                            onTap: () {
                              statusOrder != 0 &&
                                      statusOrder != 1 &&
                                      statusOrder != 4
                                  ? context.router.push(ShipingStatusPage(
                                      statusOrder: statusOrder!,
                                      orderId: state.orderDocs!.orderId,
                                      productImage: state.orderDocs!.products[0]
                                          .product!.media.featuredImage))
                                  : null;
                            },
                            child: ShippingDetailWidget(
                              shipmentMethod: state.orderDocs!.shipmentMethod,
                              proccessingInfo:
                                  state.orderDocs!.proccessingInfo!,
                              statusOrder: statusOrder,
                            )),
                        const DividerWidget(
                          isSmall: true,
                        ),
                        AddressItemWidget(
                          isOrderDetail: true,
                          addressData: orderDocs.deliveryAddress,
                          isPayment: false,
                        ),
                        const DividerWidget(),
                        Cart(
                          isShipDetail: true,
                          orderDocs: orderDocs,
                        ),
                        orderCode(context, state.orderDocs!),
                        Visibility(
                          visible: statusOrder == 0 || statusOrder == 1,
                          child: Padding(
                            padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
                            child: PrimaryButton.outline(
                              label: 'Huỷ đơn hàng',
                              onPressed: () {
                                reasonDelete(
                                    context: context,
                                    onBack: (String reason) async {
                                      final response = await context
                                          .read<StatusOrderCubit>()
                                          .cancelOrder(
                                              orderDocs.id,
                                              OrderDeleteRequest(
                                                  reason: reason));
                                      onBack!.call(response!.data!.id, 4);
                                      context.router.pop();
                                    });
                              },
                            ),
                          ),
                        )
                      ],
                    ))),
                    statusOrder != 3
                        ? BaseBottom(
                            rightButton: statusOrder == 0
                                ? 'Chờ xác nhận'
                                : statusOrder == 1
                                    ? 'Đã xác nhận'
                                    : statusOrder == 2
                                        ? 'Đang giao'
                                        : 'Mua lại',
                            oneButton: true,
                            backgroundColor:
                                statusOrder == 0 ? Colors.grey.shade400 : null,
                          )
                        : BaseBottom(
                            rightButton: 'Đánh giá',
                            onPressRight: () {
                              context.router.push(ReviewPage(
                                  cartDocs: state.orderDocs!.products));
                            },
                            leftButton: 'Mua lại',
                          )
                  ],
                ));
          },
        ),
      ),
    );
  }
}

Widget orderCode(BuildContext context, OrderDocs orderDocs) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
    margin: EdgeInsets.only(top: kDefaultPaddingWidget.h),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Mã đơn hàng',
              style: titleStyle,
            ),
            Text(
              orderDocs.orderId,
              style: titleStyle,
            )
          ],
        ),
        SizedBox(
          height: kDefaultPaddingHeightScreen,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Thời gian đặt hàng',
              style: subTitleStyle,
            ),
            Text(
              FormatDateToDayAndTime(orderDocs.proccessingInfo!.orderAt)
                  .format(),
              style: subTitleStyle.copyWith(height: 1.5),
            )
          ],
        ),
        orderDocs.proccessingInfo!.paymentAt != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thời gian thanh toán',
                    style: subTitleStyle,
                  ),
                  Text(
                    FormatDateToDayAndTime(
                            orderDocs.proccessingInfo!.paymentAt!)
                        .format(),
                    style: subTitleStyle.copyWith(height: 1.5),
                  )
                ],
              )
            : Container(),
        orderDocs.proccessingInfo!.pickupAt != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thời gian lấy hàng',
                    style: subTitleStyle,
                  ),
                  Text(
                    FormatDateToDayAndTime(orderDocs.proccessingInfo!.pickupAt!)
                        .format(),
                    style: subTitleStyle.copyWith(height: 1.5),
                  )
                ],
              )
            : Container(),
        orderDocs.proccessingInfo!.deliveredAt != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thời gian hoàn thành',
                    style: subTitleStyle.copyWith(height: 1.5),
                  ),
                  Text(
                    FormatDateToDayAndTime(
                            orderDocs.proccessingInfo!.deliveredAt!)
                        .format(),
                    style: subTitleStyle,
                  )
                ],
              )
            : Container(),
        orderDocs.proccessingInfo!.cancelAt != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thời gian huỷ',
                    style: subTitleStyle.copyWith(height: 1.5),
                  ),
                  Text(
                    FormatDateToDayAndTime(orderDocs.proccessingInfo!.cancelAt!)
                        .format(),
                    style: subTitleStyle,
                  )
                ],
              )
            : Container(),
        SizedBox(
          height: kDefaultPaddingHeightScreen,
        ),
      ],
    ),
  );
}
