// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_filter_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFilterOptionsResponse _$GetFilterOptionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetFilterOptionsResponse(
      data: FilterOptionsData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetFilterOptionsResponseToJson(
        GetFilterOptionsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

FilterOptionsData _$FilterOptionsDataFromJson(Map<String, dynamic> json) =>
    FilterOptionsData(
      stockCountries: (json['stockCountries'] as List<dynamic>?)
          ?.map((e) => StockCountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      brands: (json['brands'] as List<dynamic>?)
          ?.map((e) => FilterBrandsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterOptionsDataToJson(FilterOptionsData instance) =>
    <String, dynamic>{
      'stockCountries': instance.stockCountries,
      'brands': instance.brands,
      'categories': instance.categories,
    };

FilterBrandsModel _$FilterBrandsModelFromJson(Map<String, dynamic> json) =>
    FilterBrandsModel(
      brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilterBrandsModelToJson(FilterBrandsModel instance) =>
    <String, dynamic>{
      'brand': instance.brand,
    };

StockCountryModel _$StockCountryModelFromJson(Map<String, dynamic> json) =>
    StockCountryModel(
      country: json['country'] as String,
    );

Map<String, dynamic> _$StockCountryModelToJson(StockCountryModel instance) =>
    <String, dynamic>{
      'country': instance.country,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      category:
          CategoryItemModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'category': instance.category,
    };

CategoryItemModel _$CategoryItemModelFromJson(Map<String, dynamic> json) =>
    CategoryItemModel(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryItemModelToJson(CategoryItemModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
