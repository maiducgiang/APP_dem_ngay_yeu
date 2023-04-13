import 'package:freezed_annotation/freezed_annotation.dart';

part 'broad_state.freezed.dart';

@freezed
class BroadState with _$BroadState {
  const factory BroadState({required bool isLoading, String? error}) =
      _BroadState;

  factory BroadState.initial({
    String? id,
  }) =>
      const BroadState(
        isLoading: false,
      );
}
