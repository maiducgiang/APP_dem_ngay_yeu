import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/checkout/checkout.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/screen/main/payment/cubit/payment_cubit.dart';
import 'package:mubaha/ui/screen/main/payment/cubit/payment_state.dart';
import 'package:mubaha/ui/screen/main/voucher/ui/widget/voucher_widget.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';

class VoucherSreen extends StatelessWidget {
  final bool isShop;
  final String vendorId;
  final String s;
  final String f;
  final List<String> voucherIds;
  final Function(List<String> voucherIds, CheckoutData checkoutData)? onBack;
  const VoucherSreen(
      {Key? key,
      this.isShop = false,
      required this.vendorId,
      required this.s,
      required this.f,
      this.onBack,
      required this.voucherIds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PaymentCubit(getIt.get<CustomerRepository>())
          ..getVoucher(type: isShop ? 'vendor' : 'system', vendorId: vendorId),
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.isLoading) return const LoadingScreen();
            final vouchers = state.voucherData!.docs;
            return SafeArea(
              child: Column(
                children: [
                  const Header(
                    isBack: true,
                    title: 'Chọn voucher',
                  ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthWidget),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: vouchers.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  context.router.pop();
                                  final newVoucherIds = await context
                                      .read<PaymentCubit>()
                                      .updateListVoucher(
                                          voucherId: vouchers[index].id,
                                          voucherIds: voucherIds,
                                          vouchers: vouchers);
                                  final checkoutData = await context
                                      .read<PaymentCubit>()
                                      .selectVoucher(
                                          request: PreVoucherRequest(
                                              voucherIds: newVoucherIds),
                                          s: s,
                                          f: f);
                                  onBack?.call(newVoucherIds, checkoutData!);
                                },
                                child: VoucherWidget(
                                  isSelect:
                                      voucherIds.contains(vouchers[index].id),
                                  voucherDocs: vouchers[index],
                                ),
                              );
                            })),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
