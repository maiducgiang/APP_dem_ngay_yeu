import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_currency_symbols.dart';
import 'package:mubaha/data/enums/enum_stock_status.dart';
import 'package:mubaha/data/model/account/account.dart';
import 'package:mubaha/data/model/brand/brand.dart';
import 'package:mubaha/data/model/category/category.dart';
import 'package:mubaha/data/model/review/review_model.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String? sku;
  final String price;

  @JsonKey(
    name: 'currencySymbol',
    fromJson: stringToCurrencySymbolsType,
    toJson: currencySymbolsTypeToString,
  )
  final CurrencySymbolsType currencySymbol;
  final StockModel? stock;
  final double? discount;
  final Media2? media;
  final Account vendor;
  final Brand2 brand;
  final Category category;
  final ParentsCategories? parentCategories;
  final List<ReviewModel>? reviews;

  @JsonKey(name: 'description', defaultValue: "")
  final String description;
  Product(
      {required this.id,
      required this.name,
      this.sku,
      required this.price,
      required this.currencySymbol,
      this.stock,
      this.discount,
      this.media,
      this.reviews,
      required this.vendor,
      required this.brand,
      required this.description,
      required this.category,
      this.parentCategories});

  String? get urlVendorAvatar => vendor.profile.avatar ?? '';
  String? get urlProductThumbnail => media?.featuredImage;
  String? get vendorName => vendor.profile.fullName;

  String? get discountPercent {
    if (discount == null || discount == 0) return '0';
    return (discount! * 100).toStringAsFixed(0);
  }

  String? get getPrice {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(int.parse(price));
  }

  String? get priceAfterDiscount {
    if (discount == null || discount == 0) return price;

    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');

    return (currencyFormatter
        .format((double.parse(price) - (discount ?? 0 * 100))));
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class StockModel {
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

  StockModel({required this.quantity, required this.status});

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockModelToJson(this);
}

@JsonSerializable()
class ParentsCategories {
  final Category? firstLevel;
  final Category? secondLevel;

  ParentsCategories({
    this.firstLevel,
    this.secondLevel,
  });

  factory ParentsCategories.fromJson(Map<String, dynamic> json) =>
      _$ParentsCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$ParentsCategoriesToJson(this);
}
