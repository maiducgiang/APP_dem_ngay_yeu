import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/app_state.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/auth/siginin/signin_screen.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/cart_cubit/cart_cubit.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/cart_cubit/cart_state.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/cart.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/list_cart.dart';
import 'package:mubaha/ui/screen/main/cart/widget/emty_cart_screen.dart';
import 'package:mubaha/ui/screen/main/cart/widget/shimmer/cart_shimmer_widget.dart';
import 'package:mubaha/ui/screen/main/cart/widget/similar_product/list_similar_product.dart';
import 'package:mubaha/ui/shared/base_screen.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/repository/customer/customer_repository.dart';
import '../../../../injection.dart';
import '../payment/cubit/payment_cubit.dart';
import 'cubit/select_cart_cubit/select_cart_cubit.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key, this.isBack = true}) : super(key: key);
  final bool isBack;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController();

  final _scrollTreadhold = 250;
  // late CartCubit _cartCubit;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _cartCubit = context.read<CartCubit>();
  //   _cartCubit.getCart();
  //   _scrollController.addListener(() {
  //     final maxScrollExtent = _scrollController.position.maxScrollExtent;
  //     final currentScroll = _scrollController.position.pixels;
  //     if (maxScrollExtent == currentScroll) {
  //       _cartCubit.getCart();
  //     }
  //   });
  // }

  late Timer _timer;

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(
                vertical: kDefaultPaddingHeightScreen,
                horizontal: kDefaultPaddingWidthScreen),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.info_outline),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Bạn vẫn chưa chọn sản phẩm nào để mua',
                  style: subTitleStyle.copyWith(color: titleColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        slidableController.activeState!.close();
      },
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CartCubit(getIt.get<CustomerRepository>())..getCart(),
            ),
            BlocProvider(
              create: (context) => SelectCartCubit(),
            ),
            BlocProvider(
                create: (context) =>
                    PaymentCubit(getIt.get<CustomerRepository>())),
          ],
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, appState) {
              if (appState.userSession == null) return SigninScreen();
              return BlocConsumer<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartStateFailure) {
                      return SigninScreen();
                    }
                    if (state is CartStateLoading) {
                      return const CartShimmerWidget();
                    }
                    if (state is CartStateSuccess) {
                      if (state.cartGrouped.isEmpty) {
                        return EmptyCartScreen(
                          isBack: widget.isBack,
                        );
                      }

                      return BaseScreen(
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              //margin: const EdgeInsets.only(bottom: kDefaultPaddingScreen, top: kDefaultPaddingScreen),
                              child: Column(
                                children: [
                                  renderHeader(context, widget.isBack,
                                      appState.totalCart!),
                                  renderBody(context, state, _scrollController,
                                      refreshController),
                                ],
                              ),
                            )),
                            BaseBottom(
                              onPressRight: () async {
                                // if (state.totalPrice == '₫0') {
                                //   _showDialog();
                                // } else {
                                //   final response =
                                //   await _cartCubit.getCheckoutQuery(
                                //       cartItemIds: state.selectedProductId);
                                //   response!.status == 200
                                //       ? context.router.push(PaymentPage(
                                //       checkoutResponseData: response.data,
                                //       cartItemIds: state.selectedProductId))
                                //       : null;
                                // }
                              },
                              rightButton: 'Mua hàng',
                              isButton: false,
                              subTitle: 'Tổng thanh toán',
                              price: state.totalPrice,
                            )
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                  listener: (context, state) {});
            },
          ),
        ),
      ),
    );
  }
}

Widget renderHeader(BuildContext context, bool isBack, int toTalcart) {
  return Header(
    title: LocaleKeys.cart.tr() + '($toTalcart)',
    isBack: isBack,
  );
}

Widget renderBody(BuildContext context, CartStateSuccess state,
    ScrollController scrollController, RefreshController refreshController) {
  return Expanded(
    child: SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: () async {
        context.read<CartCubit>().getCartRefresh();
        refreshController.refreshCompleted();
      },
      controller: refreshController,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            ListCart(cartGroup: state.cartGrouped),
            state.hasReachedEnd==false?Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  context.read<CartCubit>().getCartPage();
                },
                child: Text(
                  "Xem thêm",
                  style: TextStyle(

                  ),
                ),
              ),
            ):Container(),
            // state.hasReachedEnd==false
            //     ?
            //     : Padding(
            //         padding: EdgeInsets.all(0.h),
            //         child: CircularProgressIndicator(),
            //       ),
            DividerWidget(),
            ListSimilatProduct(listProduct: state.relatedProducts),


            // const DividerWidget(),
            // const CartVoucher(),
            // const DividerWidget(),
            // const CartInfo(),
            // const ShippingInformation(),
            // const DividerWidget(),
            // const CartAttribute()
          ],
        ),
      ),
    ),
  );
}
