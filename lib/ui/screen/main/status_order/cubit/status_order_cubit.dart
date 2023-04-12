import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/order/order.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/status_order/cubit/status_order_state.dart';

class StatusOrderCubit extends Cubit<StatusOrderState> {
  final CustomerRepository _customerRepository;
  StatusOrderCubit(this._customerRepository)
      : super(StatusOrderState.initial());
  Future<void> getStatusOrder(String status) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await _customerRepository.listingOrder(
          page: '1', limit: '20', status: status);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false, orderData: response.data));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<OrderDeleteResponse?> cancelOrder(
      String id, OrderDeleteRequest deleteRequest) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.cancelOrder(id, deleteRequest);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false));
        return response;
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> updateListStatusOrder(String id) async {
    emit(state.copyWith(isLoading: true));
    final newOrderDataList =
        state.orderData!.docs!.where((e) => e.id != id).toList();
    state.orderData!.docs = newOrderDataList;
    emit(state.copyWith(isLoading: false, orderData: state.orderData));
  }

  Future<void> getOrderDetail(String orderId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.getOrderDetail(orderId);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false, orderDocs: response.data));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
