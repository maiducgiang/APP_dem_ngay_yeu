import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/shiping_status/cubit/shiping_status_state.dart';

class ShipingStatusCubit extends Cubit<ShipingStatusState> {
  final CustomerRepository _customerRepository;

  ShipingStatusCubit(this._customerRepository)
      : super(ShipingStatusState.initial());

  Future<void> getProductDetail(String orderId) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await _customerRepository.getShipmentDetails(orderId);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false, shipmentData: response.data!));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
