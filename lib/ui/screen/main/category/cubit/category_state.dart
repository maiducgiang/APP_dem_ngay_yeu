import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/category/category.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    required bool isLoading,
    required List<Category> listCategory,
    String? message,
    String? error,
  }) = _CategoryState;

  factory CategoryState.initial() => const CategoryState(
        isLoading: false,
        listCategory: [],
      );
}
