// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartpage_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartPageResponse _$CartPageResponseFromJson(Map<String, dynamic> json) =>
    CartPageResponse(
      data: CartPageData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
    );

Map<String, dynamic> _$CartPageResponseToJson(CartPageResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

CartPageData _$CartPageDataFromJson(Map<String, dynamic> json) => CartPageData(
      carts: (json['carts'] as List<dynamic>)
          .map((e) => CartModel2.fromJson(e as Map<String, dynamic>))
          .toList(),
      similarProduct: (json['similarProduct'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartPageDataToJson(CartPageData instance) =>
    <String, dynamic>{
      'carts': instance.carts,
      'similarProduct': instance.similarProduct,
    };
