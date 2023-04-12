// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsListResponse _$GetProductsListResponseFromJson(
        Map<String, dynamic> json) =>
    GetProductsListResponse(
      data: ProductsListData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetProductsListResponseToJson(
        GetProductsListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

ProductsListData _$ProductsListDataFromJson(Map<String, dynamic> json) =>
    ProductsListData(
      docs: (json['docs'] as List<dynamic>)
          .map((e) => Product2.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocs: json['totalDocs'] as int?,
      limit: json['limit'] as int?,
      totalPage: json['totalPage'] as int?,
      page: json['page'] as int?,
      pagingCounter: json['pagingCounter'] as int?,
    );

Map<String, dynamic> _$ProductsListDataToJson(ProductsListData instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'totalPage': instance.totalPage,
      'page': instance.page,
      'pagingCounter': instance.pagingCounter,
    };
