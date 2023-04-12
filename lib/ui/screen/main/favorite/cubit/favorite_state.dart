import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/product/product.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    required bool isLoading,
    required List<Product> listFavorite,
    String? message,
    String? error,
  }) = _FavoriteState;

  factory FavoriteState.initial() => const FavoriteState(
        isLoading: false,
        listFavorite: [],
      );
}
