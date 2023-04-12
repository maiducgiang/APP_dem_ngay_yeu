import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_cart_state.freezed.dart';

@freezed
class SelectCartState with _$SelectCartState {
  const factory SelectCartState({required List<String> idList}) =
      _SelectCartState;
  factory SelectCartState.initial() => const SelectCartState(idList: []);
}
