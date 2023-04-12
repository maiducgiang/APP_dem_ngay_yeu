import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/product/product2.dart';

part 'get_products_list_response.g.dart';

@JsonSerializable()
class GetProductsListResponse {
  @JsonKey(name: 'data')
  final ProductsListData data;
  final int status;
  final String? message;

  GetProductsListResponse(
      {required this.data, required this.status, this.message});

  factory GetProductsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsListResponseToJson(this);
}

@JsonSerializable()
class ProductsListData {
  final List<Product2> docs;
  final int? totalDocs;
  final int? limit;
  final int? totalPage;
  final int? page;
  final int? pagingCounter;

  ProductsListData(
      {required this.docs,
      this.totalDocs,
      this.limit,
      this.totalPage,
      this.page,
      this.pagingCounter});
  factory ProductsListData.fromJson(Map<String, dynamic> json) =>
      _$ProductsListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListDataToJson(this);
}
