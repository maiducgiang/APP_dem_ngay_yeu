import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/shipment/shipment.dart';

part 'shiping_status_state.freezed.dart';

@freezed
class ShipingStatusState with _$ShipingStatusState {
  const factory ShipingStatusState(
      {required bool isLoading,
      String? error,
      ShipmentData? shipmentData}) = _ShipingStatusState;

  factory ShipingStatusState.initial() =>
      const ShipingStatusState(isLoading: false);
}
