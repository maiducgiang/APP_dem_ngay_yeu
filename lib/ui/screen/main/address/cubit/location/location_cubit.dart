import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/location/location_model.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/address/cubit/location/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final CustomerRepository _customerRepository;
  LocationCubit(this._customerRepository) : super(LocationState.initial());
  Future<List<LocationData>> getLocationProvinces(
      {AddressDataResponse? addressData}) async {
    emit(state.copyWith(isLoading: true));
    final response = await _customerRepository.getLocationProvince();
    final indexProvince = addressData != null
        ? response.data
            .indexWhere((element) => element.code == addressData.codes.province)
        : -1;

    emit(state.copyWith(
        isLoading: false,
        provinces: response.data,
        province: addressData != null ? response.data[indexProvince] : null));
    return response.data;
  }

  Future<List<LocationData>> getLocationDistricts(
      {required String provinceId,
      AddressDataResponse? addressData,
      bool? isUpdateProvince}) async {
    emit(state.copyWith(isLoading: true, isLoadingDistrict: true));
    final response = await _customerRepository.getLocationDistrict(provinceId);
    final indexDistrict = addressData != null
        ? response.data
            .indexWhere((element) => element.code == addressData.codes.district)
        : -1;

    isUpdateProvince == true
        ? emit(state.copyWith(
            isLoading: false,
            districts: response.data,
            isLoadingDistrict: false,
            district: addressData != null ? response.data[indexDistrict] : null,
            ward: null,
            wards: null))
        : emit(state.copyWith(
            isLoading: false,
            districts: response.data,
            isLoadingDistrict: false,
            district: addressData != null ? response.data[indexDistrict] : null,
          ));
    ;
    return response.data;
  }

  Future<List<LocationData>> getLocationWards(
      {required String districtId, AddressDataResponse? addressData}) async {
    emit(state.copyWith(isLoading: true, isLoadingWard: true));
    final response = await _customerRepository.getLocationWard(districtId);
    final indexWard = addressData != null
        ? response.data
            .indexWhere((element) => element.code == addressData.codes.ward)
        : -1;
    emit(state.copyWith(
        isLoading: false,
        wards: response.data,
        isLoadingWard: false,
        ward: addressData != null ? response.data[indexWard] : null));
    return response.data;
  }

  Future<void> updateProvince(LocationData province) async {
    emit(state.copyWith(province: province));
  }

  Future<void> updateDistrict(LocationData district) async {
    emit(state.copyWith(district: district));
  }

  Future<void> updateWard(LocationData ward) async {
    emit(state.copyWith(ward: ward));
  }
}
