import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/address/cubit/address/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final CustomerRepository _customerRepository;
  AddressCubit(this._customerRepository) : super(AddressState.initial());
  Future<AddressDataResponse?> addAddress(
      {required AddressRequest request}) async {
    try {
      final response = await _customerRepository.addAddress(request);
      return response.data!;
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(error: errorMessage));
      return null;
    }
  }

  Future<AddressDataResponse?> updateAddress(
      {required String idAddress, required AddressRequest request}) async {
    try {
      final response =
          await _customerRepository.updateAddress(idAddress, request);
      return response.data!;
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(error: errorMessage));
    }
  }

  Future<void> updateListAddressWhenAddNew(
      {required AddressDataResponse addressData}) async {
    emit(state.copyWith(isUpdate: true));
    await Future.delayed(const Duration(microseconds: 100));
    final indexdDefult =
        state.addressData!.indexWhere((element) => element.isDefault == true);

    addressData.isDefault
        ? state.addressData![indexdDefult].isDefault = false
        : null;
    state.addressData!.insert(0, addressData);
    emit(state.copyWith(addressData: state.addressData, isUpdate: false));
  }

  Future<void> updateListAddressWhenUpdate(
      {required AddressDataResponse addressData}) async {
    emit(state.copyWith(isUpdate: true));
    await Future.delayed(const Duration(microseconds: 100));
    final indexdDefult =
        state.addressData!.indexWhere((element) => element.isDefault == true);
    final indexUpdate = state.addressData!
        .indexWhere((element) => element.id == addressData.id);
    addressData.isDefault
        ? state.addressData![indexUpdate].isDefault = true
        : state.addressData![indexUpdate].isDefault = false;
    addressData.isDefault
        ? state.addressData![indexdDefult].isDefault = false
        : null;

    state.addressData!.map((item) {
      if (item.id == addressData.id) return addressData;
      return item;
    });

    emit(state.copyWith(addressData: state.addressData, isUpdate: false));
  }

  Future<void> getAddress() async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.getAddress();
      if (response.status == 200) {
        final indexDefault =
            response.data!.indexWhere((element) => element.isDefault == true);

        emit(state.copyWith(
            addressData: response.data,
            isLoading: false,
            selectAddress: response.data![indexDefault]));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(error: errorMessage));
    }
  }

  Future<void> selectAddress(AddressDataResponse addressData) async {
    emit(state.copyWith(selectAddress: addressData));
  }

  Future<void> deleteAddress({required String id}) async {
    try {
      final response = await _customerRepository.deleteAddress(id);
      if (response.status == 200) {
        final newList =
            state.addressData!.where((element) => element.id != id).toList();
        emit(state.copyWith(addressData: newList));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(error: errorMessage));
    }
  }
}
