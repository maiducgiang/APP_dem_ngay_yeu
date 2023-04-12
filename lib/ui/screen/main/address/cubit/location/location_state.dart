import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/location/location_model.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState(
      {required bool isLoading,
      bool? isLoadingDistrict,
      bool? isLoadingWard,
      String? error,
      List<LocationData>? provinces,
      List<LocationData>? districts,
      List<LocationData>? wards,
      LocationData? province,
      LocationData? district,
      LocationData? ward}) = _LocationState;

  factory LocationState.initial() => const LocationState(
        isLoading: false,
      );
}
