import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/product/product.dart';

part 'favorite_response.g.dart';

@JsonSerializable()
class FavoritePageResponse {
  @JsonKey(name: 'data')
  final List<Product> data;
  final int status;

  FavoritePageResponse({
    required this.data,
    required this.status,
  });

  factory FavoritePageResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritePageResponseFromJson(json);
}
