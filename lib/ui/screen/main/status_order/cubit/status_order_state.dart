import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/order/order.dart';

part 'status_order_state.freezed.dart';

@freezed
class StatusOrderState with _$StatusOrderState {
  const factory StatusOrderState(
      {required bool isLoading,
      String? error,
      OrderData? orderData,
      OrderDocs? orderDocs}) = _StatusOrderState;

  factory StatusOrderState.initial() =>
      const StatusOrderState(isLoading: false);
}
