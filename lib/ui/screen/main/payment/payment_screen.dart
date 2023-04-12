import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/checkout/checkout.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/address/cubit/address/address_cubit.dart';
import 'package:mubaha/ui/screen/main/address/cubit/address/address_state.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/cart_item.dart';
import 'package:mubaha/ui/screen/main/order_success/ui/order_success_screen.dart';
import 'package:mubaha/ui/screen/main/payment/cubit/payment_cubit.dart';
import 'package:mubaha/ui/screen/main/payment/cubit/payment_state.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/address/address_item_widget.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class PaymentScreen extends StatefulWidget {
  final CheckoutResponseData? checkoutResponseData;
  final List<String>? cartItemIds;
  final AddToCartRequest? addToCartRequest;
  final bool isBuyNow;
  const PaymentScreen(
      {Key? key,
      this.checkoutResponseData,
      this.cartItemIds,
      this.isBuyNow = false,
      this.addToCartRequest})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isShowMore = false;
  late NavigatorState _navigator;

  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // _navigator.pushAndRemoveUntil(..., (route) => ...);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
            widget.isBuyNow
                ? BlocProvider(
                    create: (context) =>
                        PaymentCubit(getIt.get<CustomerRepository>())
                          ..buyNow(widget.addToCartRequest!),
                  )
                : BlocProvider(
                    create: (context) =>
                        PaymentCubit(getIt.get<CustomerRepository>())
                          ..getCheckout(
                              s: widget.checkoutResponseData!.s,
                              f: widget.checkoutResponseData!.f),
                  ),
            BlocProvider(
                create: (context) =>
                    AddressCubit(getIt.get<CustomerRepository>()))
          ],
          child: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.isLoading) return const LoadingScreen();

              return BlocBuilder<AddressCubit, AddressState>(
                builder: (context, addressState) {
                  if (state.checkoutData!.defaultAddress == null) {
                    context.router.replace(NewAddressPage());
                  } else {
                    final AddressDataResponse selectAddress =
                        addressState.selectAddress ??
                            state.checkoutData!.defaultAddress!;
                    return SafeArea(
                        bottom: false,
                        minimum: EdgeInsets.only(bottom: 8.h),
                        child: Column(
                          children: [
                            const Header(
                              title: 'Thanh toán',
                              isBack: true,
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
                                          context.router.push(AddressPage(
                                              addressData: selectAddress,
                                              onBack: (AddressDataResponse
                                                  addressData) async {
                                                await context
                                                    .read<AddressCubit>()
                                                    .selectAddress(addressData);
                                              }));
                                        },
                                        child: AddressItemWidget(
                                            addressData: selectAddress)),
                                    const DividerWidget(),
                                    ListView.builder(
                                      padding: EdgeInsets.only(bottom: 0),
                                      shrinkWrap: true,
                                      itemCount:
                                          state.checkoutData!.grouped.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (ctx, index) {
                                        final CheckoutGrouped item =
                                            state.checkoutData!.grouped[index];
                                        return Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      kDefaultPaddingScreen.w),
                                              margin: EdgeInsets.only(
                                                  bottom:
                                                      kDefaultPaddingScreen.h,
                                                  top: kDefaultPaddingScreen),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left:
                                                                kDefaultPaddingScreen
                                                                    .w),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        width: 30.w,
                                                        height: 30.w,
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: item
                                                              .vendor
                                                              .owner!
                                                              .profile!
                                                              .avatar,
                                                          imageBuilder:
                                                              (context,
                                                                      image) =>
                                                                  CircleAvatar(
                                                            backgroundImage:
                                                                image,
                                                            radius: 15.r,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            kDefaultPaddingScreen
                                                                .w,
                                                      ),
                                                      Text(
                                                        item.vendor.brandName,
                                                        style: titleStyle,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const DividerWidget(
                                              isSmall: true,
                                            ),
                                            ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                itemCount: state
                                                    .checkoutData!
                                                    .grouped[index]
                                                    .products!
                                                    .length,
                                                itemBuilder:
                                                    (context, indexProduct) {
                                                  return CartItemWidget(
                                                    isToDetail: false,
                                                    isCheckout: true,
                                                    index: indexProduct,
                                                    item: state
                                                            .checkoutData!
                                                            .grouped[index]
                                                            .products![
                                                        indexProduct],
                                                  );
                                                }),
                                            const DividerWidget(
                                              isSmall: true,
                                            ),
                                            voucherItem(
                                                context: context,
                                                isShop: true,
                                                vendorId: state.checkoutData!
                                                    .grouped[index].vendor.id,
                                                s: widget.isBuyNow
                                                    ? state.s!
                                                    : widget
                                                        .checkoutResponseData!
                                                        .s,
                                                f: widget.isBuyNow
                                                    ? state.f!
                                                    : widget
                                                        .checkoutResponseData!
                                                        .f,
                                                state: state,
                                                checkoutGrouped: state
                                                    .checkoutData!
                                                    .grouped[index]),
                                            const DividerWidget(
                                              isSmall: true,
                                            ),
                                            summaryItem(
                                                context: context,
                                                totalPrice: state
                                                    .checkoutData!
                                                    .grouped[index]
                                                    .getTotalPrice!,
                                                priceProduct: state
                                                    .checkoutData!
                                                    .totalOrdersPriceFormat,
                                                discount: state
                                                    .checkoutData!
                                                    .grouped[index]
                                                    .getVoucherDiscountAmount!),
                                            state.checkoutData!.grouped.length -
                                                        1 ==
                                                    index
                                                ? Container()
                                                : const DividerWidget()
                                          ],
                                        );
                                      },
                                    ),
                                    const DividerWidget(),
                                    voucherItem(
                                        context: context,
                                        s: widget.isBuyNow
                                            ? state.s!
                                            : widget.checkoutResponseData!.s,
                                        f: widget.isBuyNow
                                            ? state.f!
                                            : widget.checkoutResponseData!.f,
                                        state: state,
                                        voucher: state.checkoutData!
                                            .totalVoucherDiscountFormat),
                                    const DividerWidget(),
                                    summaryItem(
                                        context: context,
                                        totalPrice: state.checkoutData!
                                            .totalOrdersPriceFormat,
                                        priceProduct: state.checkoutData!
                                            .totalOrdersPriceFormat,
                                        discount: state.checkoutData!
                                            .totalVoucherDiscountFormat,
                                        isShop: false),
                                  ],
                                ),
                              ),
                            ),
                            BaseBottom(
                              onPressRight: () async {
                                final response = await context
                                    .read<PaymentCubit>()
                                    .createCheckout(
                                        s: widget.isBuyNow
                                            ? state.s!
                                            : widget.checkoutResponseData!.s,
                                        f: widget.isBuyNow
                                            ? state.f!
                                            : widget.checkoutResponseData!.f,
                                        checkoutCreate: CheckoutCreate(
                                            address: selectAddress.id,
                                            method: 'cod',
                                            voucherIds:
                                                state.voucherIds ?? []));
                                if (response!.status == 200) {
                                  _navigator.push(MaterialPageRoute(
                                      builder: (context) =>
                                          OrderSuccessScreen()));
                                }
                              },
                              rightButton: 'Thanh toán',
                              isButton: false,
                              price: state.checkoutData!.totalOrdersPriceFormat,
                              subTitle: 'Tổng thanh toán',
                            )
                          ],
                        ));
                  }
                  return Container();
                },
              );
            },
          )),
    );
  }

  Widget voucherItem(
      {required BuildContext context,
      bool isShop = false,
      String? vendorId,
      required String s,
      required String f,
      required PaymentState state,
      String? voucher,
      CheckoutGrouped? checkoutGrouped}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.airplane_ticket_outlined,
                color: primaryColor,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                isShop ? 'Voucher của Shop' : 'Mubaha Voucher',
                style: subHeadingStyle.copyWith(color: titleColor),
              )
            ],
          ),
          GestureDetector(
              onTap: () {
                context.router.push(
                  VoucherPage(
                      isShop: isShop,
                      vendorId: vendorId ?? '',
                      s: s,
                      f: f,
                      voucherIds: state.voucherIds ?? [],
                      onBack: (List<String> voucherIds,
                          CheckoutData checkoutData) async {
                        await context
                            .read<PaymentCubit>()
                            .updateListVoucher(voucherIds: voucherIds);
                        await context
                            .read<PaymentCubit>()
                            .updatePaymentWhenSelectVoucher(checkoutData);
                      }),
                );
              },
              child: !isShop
                  ? state.checkoutData!.totalSystemDiscount == null ||
                          state.checkoutData!.totalSystemDiscount == 0
                      ? Text(
                          'Chọn voucher >',
                          style: subTitleStyle,
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green)),
                          child: Text(
                            '-' + state.checkoutData!.totalSystemDiscountFormat,
                            style: subTitleStyle.copyWith(color: Colors.green),
                          ),
                        )
                  : checkoutGrouped!.voucherDiscountAmount == null ||
                          checkoutGrouped.voucherDiscountAmount == 0
                      ? Text(
                          'Chọn voucher >',
                          style: subTitleStyle,
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green)),
                          child: Text(
                            '-' + checkoutGrouped.getVoucherDiscountAmount!,
                            style: subTitleStyle.copyWith(color: Colors.green),
                          ),
                        ))
        ],
      ),
    );
  }

  Widget summaryItem(
      {required BuildContext context,
      required String totalPrice,
      required String priceProduct,
      required String discount,
      bool isShop = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        children: [
          Visibility(
            visible: discount != '₫0' && !isShop,
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Voucher giảm giá',
                      style: textCategoryNameStyle,
                    ),
                    Text(
                      '- ' + discount,
                      style: textCategoryNameStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng số tiền',
                style: subHeadingStyle.copyWith(color: titleColor),
              ),
              Text(
                totalPrice,
                style: subHeadingStyle.copyWith(
                    color: isShop ? primaryColor : titleColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
