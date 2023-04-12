import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/checkout/checkout.dart';
import 'package:mubaha/data/model/voucher/voucher.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    required bool isLoading,
    CheckoutData? checkoutData,
    VoucherData? voucherData,
    AddressDataResponse? defaultAddress,
    List<String>? voucherIds,
    String? error,
    String? s,
    String? f,
    CheckoutResponseData? responseData,
  }) = _PaymentState;
  factory PaymentState.initial() => const PaymentState(isLoading: false);
}
