import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/vendor/bloc/vendor_state.dart';
import 'package:dio/dio.dart';

class VendorCubit extends Cubit<VendorState> {
  final CustomerRepository _customerRepository;
  final String id;
  VendorCubit(this._customerRepository, this.id)
      : super(VendorState.initial(id: id));

  Future<void> getVendorDetail(String id) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await _customerRepository.getVendorDetail(id);
      if (response.status == 200) {
        final data = response.data;
        emit(state.copyWith(
            isLoading: false,
            vendor: data.vendor,
            dealsOfTheDay: data.dealsOfTheDay,
            flashSales: data.flashSales,
            suggestedForYou: data.suggestedForYou));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
