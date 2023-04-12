import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/product/product.dart';

part 'cartpage_reponse.g.dart';

@JsonSerializable()
class CartPageResponse {
  @JsonKey(name: 'data')
  final CartPageData data;
  final int status;

  CartPageResponse({
    required this.data,
    required this.status,
  });

  factory CartPageResponse.fromJson(Map<String, dynamic> json) =>
      _$CartPageResponseFromJson(json);
}

@JsonSerializable()
class CartPageData {
  final List<CartModel2> carts;
  final List<Product>? similarProduct;

  CartPageData({
    required this.carts,
    required this.similarProduct,
  });

  factory CartPageData.fromJson(Map<String, dynamic> json) =>
      _$CartPageDataFromJson(json);
}
