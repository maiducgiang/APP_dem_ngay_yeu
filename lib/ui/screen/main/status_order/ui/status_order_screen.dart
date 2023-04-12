import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/order/order.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/app_state.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/auth/siginin/signin_screen.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/cart.dart';
import 'package:mubaha/ui/screen/main/status_order/cubit/status_order_cubit.dart';
import 'package:mubaha/ui/screen/main/status_order/cubit/status_order_state.dart';
import 'package:mubaha/ui/screen/main/status_order/ui/widget/status_order_shimmer_widget.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/empty/empty_screen.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

final List<String> statusApiList = [
  'awaiting_confirmation',
  'pickup_available',
  'in_transit',
  'delivered',
  'cancelled'
];

class StatusOrderScreen extends StatefulWidget {
  const StatusOrderScreen({Key? key}) : super(key: key);

  @override
  State<StatusOrderScreen> createState() => _StatusOrderScreenState();
}

class _StatusOrderScreenState extends State<StatusOrderScreen> {
  final isError = false;
  final List<String> statusList = [
    'Chờ xác nhận',
    'Chờ lấy hàng',
    'Đang giao',
    'Đã giao',
    'Đã huỷ',
  ];
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
  }

  int statusIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        body: BlocProvider(
          create: (context) => StatusOrderCubit(getIt.get<CustomerRepository>())
            ..getStatusOrder(statusApiList[statusIndex]),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, appState) {
              if (appState.userSession == null) return SigninScreen();

              return BlocConsumer<StatusOrderCubit, StatusOrderState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return SafeArea(
                    child: Column(
                      children: [
                        const Header(
                          isBack: true,
                          title: 'Đơn mua',
                        ),
                        Expanded(
                          child: isError
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPaddingWidthWidget),
                                  child: const EmptyScreen(
                                    title: 'Rất tiếc !! Chưa có đơn hàng',
                                    subTitle:
                                        'Có vẻ như bạn chưa thực hiện bất kỳ đơn đặt hàng nào.',
                                    buttonTitle: 'MUA NGAY',
                                  ),
                                )
                              : Column(
                                  children: [
                                    Container(
                                      height: 30.h,
                                      child: Center(
                                        child: ListView.builder(
                                            controller: _scrollController,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: statusList.length,
                                            itemBuilder: ((context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) =>
                                                              _scrollToBottom());
                                                  setState(() {
                                                    statusIndex = index;
                                                    context
                                                        .read<
                                                            StatusOrderCubit>()
                                                        .getStatusOrder(
                                                            statusApiList[
                                                                statusIndex]);
                                                  });
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          kDefaultPaddingWidthScreen,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: statusIndex ==
                                                                        index
                                                                    ? primaryColor
                                                                    : Colors
                                                                        .transparent))),
                                                    child: Center(
                                                        child: Text(
                                                      statusList[index],
                                                      style: subTitleStyle
                                                          .copyWith(
                                                              color: statusIndex ==
                                                                      index
                                                                  ? primaryColor
                                                                  : titleColor),
                                                    ))),
                                              );
                                            })

                                            // purchaseItem(state.orderData!)
                                            ),
                                      ),
                                    ),
                                    const DividerWidget(
                                      isSmall: true,
                                    ),
                                    state.isLoading
                                        ? const Expanded(
                                            child: StatusOrderShimmer())
                                        : state.orderData == null ||
                                                state.orderData!.docs!.isEmpty
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultPaddingWidthWidget,
                                                    vertical:
                                                        kDefaultPaddingHeightWidget),
                                                child: const EmptyScreen(
                                                  title: 'Chưa có đơn hàng',
                                                ),
                                              )
                                            : Expanded(
                                                child: purchaseItem(
                                                    state.orderData!))
                                  ],
                                ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget purchaseItem(OrderData orderData) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: orderData.docs!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              index == 0 ? DividerWidget() : Container(),
              GestureDetector(
                onTap: () async {
                  context.router.push(OrderDetailPage(
                      cartDocs: orderData.docs![index].products,
                      orderId: orderData.docs![index].orderId,
                      statusOrder: statusIndex,
                      onBack: (String id, int indexStatus) async {
                        setState(() {
                          statusIndex = indexStatus;
                        });
                        context
                            .read<StatusOrderCubit>()
                            .getStatusOrder(statusApiList[indexStatus]);
                      }));
                },
                child: Container(
                  color: Colors.transparent,
                  child: Cart(
                    isToDetail: false,
                    statusOrder: statusIndex,
                    orderDocs: orderData.docs![index],
                    isLastOrder: index == orderData.totalDocs - 1,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

// Widget historyItem() {
//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   SearchWidget(),
//                   Container(
//                     height: 35.h,
//                     width: 35.h,
//                     margin: EdgeInsets.only(left: kDefaultPaddingWidthScreen),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(3),
//                         color: primaryColor),
//                     child: const Icon(
//                       Icons.filter_list,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//               const Heading(label: 'Đơn mua'),
//               GestureDetector(
//                 // onTap: () => context.router
//                 //     .push(OrderDetailPage()),
//                 child: const PurchaseItemWidget(
//                   isInfor: false,
//                 ),
//               ),
//               Container(
//                 margin:
//                     EdgeInsets.symmetric(vertical: kDefaultPaddingWidthWidget),
//                 child: const DividerWidget(
//                   isSmall: true,
//                 ),
//               ),
//               const PurchaseItemWidget(
//                 isInfor: false,
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(top: kDefaultPaddingWidthWidget),
//           child: DividerWidget(),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
//           child: Column(
//             children: [
//               Heading(label: 'Đã mua'),
//               PurchaseItemWidget(),
//               Container(
//                 margin:
//                     EdgeInsets.symmetric(vertical: kDefaultPaddingHeightWidget),
//                 child: const DividerWidget(
//                   isSmall: true,
//                 ),
//               ),
//               PurchaseItemWidget()
//             ],
//           ),
//         ),
//         SizedBox(
//           height: kDefaultPaddingHeightWidget,
//         )
//       ],
//     ),
//   );
// }
