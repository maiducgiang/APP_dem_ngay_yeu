import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState(
      {required bool isLoading,
      ProductDetail? detailProduct,
      List<Product2>? relatedProducts,
      List<Product2>? newProducts,
      required bool isAddingtoCart,
      required bool addedToCart,
      String? id,
      String? error}) = _ProductDetailState;

  factory ProductDetailState.initial({
    String? id,
  }) =>
      ProductDetailState(
          isLoading: false, id: id, isAddingtoCart: false, addedToCart: false);
}
