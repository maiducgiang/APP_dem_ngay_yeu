import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_stock_country.dart';
import 'package:mubaha/data/enums/enum_stock_status.dart';

import 'package:mubaha/data/model/category/category.dart';

import '../brand/brand.dart';
import '../cart/cart_model.dart';
import '../category/category_product_list.dart';

part 'product4.g.dart';

@JsonSerializable()
class Product4 {
  final PriceRange priceRange;
  final Stock2 stock;
  final Media media;
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final num discountedPrice;
  final num price;
  final String currencySymbol;
  final num discount;
  final num? avgRating;
  final int? totalReviews;

  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: 'description', defaultValue: "")
  final String description;
  Product4({
    required this.priceRange,
    required this.stock,
    required this.media,
    required this.id,
    required this.name,
    required this.discountedPrice,
    required this.price,
    required this.currencySymbol,
    required this.discount,
    this.totalReviews,
     this.avgRating,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
  });

  String? get urlProductThumbnail => media.featuredImage;

  String? get discountPercent {
    if (discount == 0) return '0';
    return discount.toStringAsFixed(0);
  }

  String? get getPrice {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    return currencyFormatter.format(price);
  }

  String? get getCurentPrice {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    return currencyFormatter.format(price  - price*discount!);
  }

  // String? get priceAfterDiscount {
  //   if (discount == null || discount == 0) return price;

  //   final currencyFormatter =
  //       NumberFormat('${currencySymbol.display()}#,##0', 'ID');

  //   return (currencyFormatter
  //       .format((double.parse(price) - (discount ?? 0 * 100))));
  // }

  factory Product4.fromJson(Map<String, dynamic> json) =>
      _$Product4FromJson(json);

  Map<String, dynamic> toJson() => _$Product4ToJson(this);
}