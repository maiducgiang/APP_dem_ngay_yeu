import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/checkout/checkout.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/data/model/voucher/voucher.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/payment/cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CustomerRepository _customerRepository;
  PaymentCubit(this._customerRepository) : super(PaymentState.initial());

  Future<void> getCheckout({required String s, required String f}) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await _customerRepository.getCheckout(s, f);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false, checkoutData: response.data));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> getVoucher({required String type, String? vendorId}) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.getVouchers(
          page: '1', limit: '10', type: type, vendorId: vendorId!);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false, voucherData: response.data));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<CheckoutData?> selectVoucher(
      {required PreVoucherRequest request,
      required String s,
      required String f}) async {
    try {
      final response =
          await _customerRepository.preVoucher(request: request, s: s, f: f);
      if (response.status == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<List<String>> updateListVoucher(
      {String? voucherId,
      required List<String> voucherIds,
      List<VoucherDocs>? vouchers}) async {
    final List<String> newVoucherIds = voucherIds;
    if (vouchers != null) {
      for (int i = 0; i < voucherIds.length; i++) {
        for (int j = 0; j < vouchers.length; j++) {
          if (voucherIds[i] == vouchers[j].id) {
            voucherIds.remove(voucherIds[i]);
            break;
          }
        }
      }
    }
    final newList =
        newVoucherIds.where((element) => element != voucherId).toList();
    voucherId != null ? newList.add(voucherId) : null;
    emit(state.copyWith(voucherIds: newList));
    return newList;
  }

  Future<void> updatePaymentWhenSelectVoucher(CheckoutData checkoutData) async {
    state.checkoutData!.totalOrdersPrice = checkoutData.totalOrdersPrice;
    state.checkoutData!.totalVoucherDiscount =
        checkoutData.totalVoucherDiscount;
    state.checkoutData!.totalSystemDiscount = checkoutData.totalSystemDiscount;

    for (int i = 0; i < checkoutData.grouped.length; i++) {
      if (state.checkoutData!.grouped[i].vendor.id ==
          checkoutData.grouped[i].vendor.id) {
        state.checkoutData!.grouped[i].voucherDiscountAmount =
            checkoutData.grouped[i].voucherDiscountAmount;
        state.checkoutData!.grouped[i].totalPrice =
            checkoutData.grouped[i].totalPrice;
      }
    }
    emit(state.copyWith(checkoutData: state.checkoutData));
  }

  Future<AddressResponseDelete?> createCheckout(
      {required String s,
      required String f,
      required CheckoutCreate checkoutCreate}) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response =
          await _customerRepository.createCheckout(s, f, checkoutCreate);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false));
        return response;
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> buyNow(AddToCartRequest request) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.buyNow(request);
      if (response.status == 200) {
        final data = response.data;
        final responseCheckout =
            await _customerRepository.getCheckout(data!.s, data.f);
        if (responseCheckout.status == 200) {
          emit(state.copyWith(
              isLoading: false,
              checkoutData: responseCheckout.data,
              s: data.s,
              f: data.f));
        }
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
