// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      sku: json['sku'] as String?,
      price: json['price'] as String,
      currencySymbol:
          stringToCurrencySymbolsType(json['currencySymbol'] as String),
      stock: json['stock'] == null
          ? null
          : StockModel.fromJson(json['stock'] as Map<String, dynamic>),
      discount: (json['discount'] as num?)?.toDouble(),
      media: json['media'] == null
          ? null
          : Media2.fromJson(json['media'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendor: Account.fromJson(json['vendor'] as Map<String, dynamic>),
      brand: Brand2.fromJson(json['brand'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      parentCategories: json['parentCategories'] == null
          ? null
          : ParentsCategories.fromJson(
              json['parentCategories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'currencySymbol': currencySymbolsTypeToString(instance.currencySymbol),
      'stock': instance.stock,
      'discount': instance.discount,
      'media': instance.media,
      'vendor': instance.vendor,
      'brand': instance.brand,
      'category': instance.category,
      'parentCategories': instance.parentCategories,
      'reviews': instance.reviews,
      'description': instance.description,
    };

StockModel _$StockModelFromJson(Map<String, dynamic> json) => StockModel(
      quantity: json['quantity'] as int? ?? 1,
      status: stringToStockStatusType(json['status'] as String),
    );

Map<String, dynamic> _$StockModelToJson(StockModel instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'status': stockStatusTypeToString(instance.status),
    };

ParentsCategories _$ParentsCategoriesFromJson(Map<String, dynamic> json) =>
    ParentsCategories(
      firstLevel: json['firstLevel'] == null
          ? null
          : Category.fromJson(json['firstLevel'] as Map<String, dynamic>),
      secondLevel: json['secondLevel'] == null
          ? null
          : Category.fromJson(json['secondLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParentsCategoriesToJson(ParentsCategories instance) =>
    <String, dynamic>{
      'firstLevel': instance.firstLevel,
      'secondLevel': instance.secondLevel,
    };
