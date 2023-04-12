import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/brand/brand.dart';

part 'get_filter_options_response.g.dart';

@JsonSerializable()
class GetFilterOptionsResponse {
  @JsonKey(name: 'data')
  final FilterOptionsData data;
  final int status;
  final String? message;

  GetFilterOptionsResponse(
      {required this.data, required this.status, this.message});

  factory GetFilterOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFilterOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFilterOptionsResponseToJson(this);
}

@JsonSerializable()
class FilterOptionsData {
  final List<StockCountryModel>? stockCountries;
  final List<FilterBrandsModel>? brands;
  final List<CategoryModel>? categories;

  FilterOptionsData({this.stockCountries, this.brands, this.categories});
  factory FilterOptionsData.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionsDataFromJson(json);

  Map<String, dynamic> toJson() => _$FilterOptionsDataToJson(this);
}

@JsonSerializable()
class FilterBrandsModel {
  final Brand brand;

  FilterBrandsModel({required this.brand});
  factory FilterBrandsModel.fromJson(Map<String, dynamic> json) =>
      _$FilterBrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterBrandsModelToJson(this);
}

@JsonSerializable()
class StockCountryModel {
  final String country;
  StockCountryModel({required this.country});
  factory StockCountryModel.fromJson(Map<String, dynamic> json) =>
      _$StockCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockCountryModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  final CategoryItemModel category;

  CategoryModel({required this.category});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryItemModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  CategoryItemModel({required this.id, required this.name});
  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemModelToJson(this);
}

class PriceRangeModel {
  final String min;
  final String max;
  final String title;

  PriceRangeModel({required this.min, required this.max, required this.title});
}

class StarModel {
  final String rating;
  final String title;

  StarModel({required this.rating, required this.title});
}
