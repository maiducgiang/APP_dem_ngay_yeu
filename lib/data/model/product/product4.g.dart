// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product4 _$Product4FromJson(Map<String, dynamic> json) => Product4(
      priceRange:
          PriceRange.fromJson(json['priceRange'] as Map<String, dynamic>),
      stock: Stock2.fromJson(json['stock'] as Map<String, dynamic>),
      media: Media.fromJson(json['media'] as Map<String, dynamic>),
      id: json['_id'] as String,
      name: json['name'] as String,
      discountedPrice: json['discountedPrice'] as num,
      price: json['price'] as num,
      currencySymbol: json['currencySymbol'] as String,
      discount: json['discount'] as num,
      totalReviews: json['totalReviews'] as int?,
      avgRating: json['avgRating'] as num?,
      slug: json['slug'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$Product4ToJson(Product4 instance) => <String, dynamic>{
      'priceRange': instance.priceRange,
      'stock': instance.stock,
      'media': instance.media,
      '_id': instance.id,
      'name': instance.name,
      'discountedPrice': instance.discountedPrice,
      'price': instance.price,
      'currencySymbol': instance.currencySymbol,
      'discount': instance.discount,
      'avgRating': instance.avgRating,
      'totalReviews': instance.totalReviews,
      'slug': instance.slug,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'description': instance.description,
    };
