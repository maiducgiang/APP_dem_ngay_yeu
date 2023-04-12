// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      id: json['_id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      imageId: json['imageId'] as String?,
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => AttributesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String,
      discount: (json['discount'] as num).toDouble(),
      stock: json['stock'] == null
          ? null
          : StockModel2.fromJson(json['stock'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'imageId': instance.imageId,
      'attributes': instance.attributes,
      'image': instance.image,
      'discount': instance.discount,
      'stock': instance.stock,
    };

AttributesModel _$AttributesModelFromJson(Map<String, dynamic> json) =>
    AttributesModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      discount: (json['discount'] as num).toDouble(),
      stock: Stock.fromJson(json['stock'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttributesModelToJson(AttributesModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'discount': instance.discount,
      'stock': instance.stock,
    };

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      quantity: json['quantity'] as int,
      status: json['status'] as String,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'status': instance.status,
    };
