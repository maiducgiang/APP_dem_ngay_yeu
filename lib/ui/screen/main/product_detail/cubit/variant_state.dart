import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant_state.freezed.dart';

@freezed
class VariantState with _$VariantState {
  const factory VariantState(
      {required bool isLoading,
      String? productId,
      String? selectedVariant,
      String? selectedAttribute,
      int? amount,
      required bool enableAdd,
      int? variantIndex,
      int? attributeIndex}) = _VariantState;

  factory VariantState.initial() =>
      const VariantState(isLoading: false, enableAdd: false);
}
