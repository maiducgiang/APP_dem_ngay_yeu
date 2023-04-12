import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/address/address_model.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    required bool isLoading,
    List<AddressDataResponse>? addressData,
    AddressDataResponse? selectAddress,
    bool? isUpdate,
    String? error,
  }) = _AddressState;
  factory AddressState.initial() => const AddressState(isLoading: false);
}
