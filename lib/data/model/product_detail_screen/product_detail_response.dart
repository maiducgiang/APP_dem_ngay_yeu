import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_currency_symbols.dart';
import 'package:mubaha/data/model/brand/brand.dart';
import 'package:mubaha/data/model/category/category.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/data/model/review/review_model.dart';
import 'package:mubaha/data/model/variant/variant.dart';
import 'package:mubaha/data/model/vendor/vendor.dart';

part 'product_detail_response.g.dart';

@JsonSerializable()
class ProductDetailResponse {
  @JsonKey(name: 'data')
  final DataProductDetail? data;
  final int status;
  final String message;
  final String? errors;

  ProductDetailResponse(
      {this.data, required this.status, required this.message, this.errors});

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseFromJson(json);
}

@JsonSerializable()
class DataProductDetail {
  final ProductDetail detailProduct;
  final List<Product2> relatedProducts;
  // final List<Product2> newProducts;

  DataProductDetail(
      {required this.detailProduct,
      // required this.newProducts,
      required this.relatedProducts});
  factory DataProductDetail.fromJson(Map<String, dynamic> json) =>
      _$DataProductDetailFromJson(json);
}

@JsonSerializable()
class ProductDetail {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final int price;

  @JsonKey(
    name: 'currencySymbol',
    fromJson: stringToCurrencySymbolsType,
    toJson: currencySymbolsTypeToString,
  )
  final CurrencySymbolsType currencySymbol;
  final StockModel2? stock;
  final double discount;
  final Media media;
  final Vendor vendor;
  final Brand brand;
  final Category category;
  final String? slug;
  final String? link;
  final int? discountPercent;
  final double? currentPrice;
  final bool? isDeleted;
  final String? shortDescription;
  final List<ReviewModel>? reviews;
  final List<Variant>? variants;
  final PriceRange priceRange;
  final String variantLabel;
  final String attributeLabel;
  final int? amount;

  @JsonKey(name: 'description', defaultValue: "")
  final String description;
  ProductDetail(
      {required this.id,
      required this.name,
      required this.price,
      required this.currencySymbol,
      this.stock,
      required this.discount,
      required this.media,
      required this.vendor,
      required this.brand,
      required this.description,
      required this.category,
      this.slug,
      this.link,
      this.discountPercent,
      this.currentPrice,
      this.isDeleted,
      this.variants,
      this.shortDescription,
      this.reviews,
      required this.priceRange,
      required this.variantLabel,
      required this.attributeLabel,
      this.amount});

  String? get urlProductThumbnail => media.featuredImage;

  String? get discountPercentFinal {
    if (discount == 0) return '0';
    return (discount * 100).toStringAsFixed(0);
  }

  String? get getPrice {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(price);
  }

  String? get getPriceMin {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(priceRange.min);
  }

  String? get getPriceMax {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(priceRange.max);
  }

  String? get getCurrentPrice {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    if (discount == 0) return currencyFormatter.format(price);
    return currencyFormatter.format(price * (1 - discount));
  }

  String? get getCurrentPriceMin {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    if (discount == 0) return currencyFormatter.format(priceRange.min);
    return currencyFormatter.format(priceRange.min * (1 - discount));
  }

  String? get getCurrentPriceMax {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    if (discount == 0) return currencyFormatter.format(priceRange.max);
    return currencyFormatter.format(priceRange.max * (1 - discount));
  }

  double? get rate {
    double rating = 0;
    for (int i = 0; i < reviews!.length; i++) {
      rating += reviews![i].rating;
    }
    // reviews.map((e) => rating += e.rating);
    return (rating / reviews!.length);
  }

  // String? get priceAfterDiscount {
  //   if (discount == null || discount == 0) return price;

  //   final currencyFormatter =
  //       NumberFormat('${currencySymbol.display()}#,##0', 'ID');

  //   return (currencyFormatter
  //       .format((double.parse(price) - (discount ?? 0 * 100))));
  // }

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}

@JsonSerializable()
class PriceRange {
  final double min;
  final double max;
  PriceRange({required this.min, required this.max});

  factory PriceRange.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeFromJson(json);

  Map<String, dynamic> toJson() => _$PriceRangeToJson(this);
}

@JsonSerializable()
class AddToCartRequest {
  final String productId;
  final String? selectedVariant;
  final String? selectedAttribute;
  final int amount;
  final String? vendor;
  AddToCartRequest(
      {required this.productId,
      this.selectedVariant,
      this.selectedAttribute,
      this.vendor,
      this.amount = 0});
  factory AddToCartRequest.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);
}

@JsonSerializable()
class AddToCartResponse {
  final AddToCartResponseData? data;
  final int status;
  final String message;
  final String? error;
  AddToCartResponse(
      {this.data, required this.status, required this.message, this.error});
  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);
}

@JsonSerializable()
class AddToCartResponseData {
  @JsonKey(name: '_id')
  final String id;
  final String product;
  final int amount;
  final String owner;
  final String status;
  AddToCartResponseData(
      {required this.id,
      required this.product,
      required this.amount,
      required this.owner,
      required this.status});

  factory AddToCartResponseData.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseDataToJson(this);
}
