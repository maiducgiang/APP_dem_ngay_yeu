import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_stock_country.dart';
import 'package:mubaha/data/enums/enum_stock_status.dart';

import 'package:mubaha/data/model/category/category.dart';

import '../brand/brand.dart';
import '../cart/cart_model.dart';
import '../category/category_product_list.dart';


part 'product2.g.dart';

@JsonSerializable()
class Product2 {
  final Media media;
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final num price;
  final String currencySymbol;
  final num discount;
  final int? totalReviews;
  final String slug;
  Product2( {
    required this.media,
    required this.id,
    required this.name,
    required this.price,
    required this.currencySymbol,
    required this.discount,
    required this.totalReviews,
    required this.slug,
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
    return currencyFormatter.format(price * (1 - discount));
  }

  // String? get priceAfterDiscount {
  //   if (discount == null || discount == 0) return price;

  //   final currencyFormatter =
  //       NumberFormat('${currencySymbol.display()}#,##0', 'ID');

  //   return (currencyFormatter
  //       .format((double.parse(price) - (discount ?? 0 * 100))));
  // }

  factory Product2.fromJson(Map<String, dynamic> json) =>
      _$Product2FromJson(json);

  Map<String, dynamic> toJson() => _$Product2ToJson(this);
}

@JsonSerializable()
class StockModel2 {
  @JsonKey(name: 'quantity', defaultValue: 1)
  final int quantity;
  @JsonKey(
    name: 'status',
    fromJson: stringToStockStatusType,
    toJson: stockStatusTypeToString,
  )
  final StockStatusType status;

  // @JsonKey(
  //   name: 'country',
  //   fromJson: stringToStockCountryType,
  //   toJson: stockCountryTypeToString,
  // )
  // final StockCountryType country;

  StockModel2({required this.quantity, required this.status});

  factory StockModel2.fromJson(Map<String, dynamic> json) =>
      _$StockModel2FromJson(json);

  Map<String, dynamic> toJson() => _$StockModel2ToJson(this);
}

@JsonSerializable()
class ParentsCategories2 {
  final Category? firstLevel;
  final Category? secondLevel;

  ParentsCategories2({
    this.firstLevel,
    this.secondLevel,
  });

  factory ParentsCategories2.fromJson(Map<String, dynamic> json) =>
      _$ParentsCategories2FromJson(json);

  Map<String, dynamic> toJson() => _$ParentsCategories2ToJson(this);
}
