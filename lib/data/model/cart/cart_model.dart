import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_currency_symbols.dart';
import 'package:mubaha/data/model/account/account.dart';
import 'package:mubaha/data/model/brand/brand.dart';
import 'package:mubaha/data/model/product/product.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/data/model/review/review_model.dart';
import 'package:mubaha/data/model/variant/variant.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartResponse {
  final CartData? data;
  final int? status;
  final String? message;
  final String? errors;
  CartResponse(
      {this.data, required this.status, required this.message, this.errors});
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}

@JsonSerializable()
class CartPaginateResponse {
  final CartItems? data;
  final int status;
  final String message;
  final String? errors;
  CartPaginateResponse(
      {this.data, required this.status, required this.message, this.errors});
  factory CartPaginateResponse.fromJson(Map<String, dynamic> json) =>
      _$CartPaginateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartPaginateResponseToJson(this);
}

@JsonSerializable()
class CartData {
  final List<Product2> relatedProducts;
  final CartItems? cartItems;

  CartData({this.cartItems, required this.relatedProducts});
  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}

@JsonSerializable()
class CartItems {
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? prevPage;
  final int? nextPage;
  final List<CartGrouped> grouped;

  CartItems({
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
     this.prevPage,
     this.nextPage,
    required this.grouped,
  });
  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}

@JsonSerializable()
class CartDocs {
  @JsonKey(name: "_id")
  final String? id;
  final int amount;
  final Variant? selectedVariant;
  final AttributesModel? selectedAttribute;
  final String? owner;
  final String? status;
  final CartProduct? product;
  final CartVendor? vendor;
  final double price;
  final double discount;
  final double discountedPrice;
  final double lastPrice;
  @JsonKey(
    name: 'currencySymbol',
    fromJson: stringToCurrencySymbolsType,
    toJson: currencySymbolsTypeToString,
  )
  final CurrencySymbolsType currencySymbol;
  bool isSelect;

  CartDocs(
      {this.id,
      required this.amount,
      this.owner,
      this.product,
      this.selectedAttribute,
      this.selectedVariant,
      this.status,
      this.vendor,
      required this.discount,
      required this.discountedPrice,
      required this.lastPrice,
      required this.price,
      required this.currencySymbol,
      this.isSelect = false});

  String? get getPrice {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(price);
  }

  String? get getPriceDiscount {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(discountedPrice);
  }

  factory CartDocs.fromJson(Map<String, dynamic> json) =>
      _$CartDocsFromJson(json);

  Map<String, dynamic> toJson() => _$CartDocsToJson(this);
}

@JsonSerializable()
class CartGrouped {
  final CartVendor vendor;
  List<CartDocs> products;
  bool isSelectAll;

  CartGrouped(
      {required this.products, required this.vendor, this.isSelectAll = false});
  factory CartGrouped.fromJson(Map<String, dynamic> json) =>
      _$CartGroupedFromJson(json);

  Map<String, dynamic> toJson() => _$CartGroupedToJson(this);
}

@JsonSerializable()
class CartVendor {
  @JsonKey(name: '_id')
  final String id;
  final String brandName;
  final CartVendorOwner? owner;
  CartVendor({required this.id, required this.brandName, this.owner});
  factory CartVendor.fromJson(Map<String, dynamic> json) =>
      _$CartVendorFromJson(json);

  Map<String, dynamic> toJson() => _$CartVendorToJson(this);
}

@JsonSerializable()
class CartVendorOwner {
  @JsonKey(name: '_id')
  final String id;
  final String username;
  final CartVendorProfile? profile;
  CartVendorOwner({this.profile, required this.username, required this.id});
  factory CartVendorOwner.fromJson(Map<String, dynamic> json) =>
      _$CartVendorOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$CartVendorOwnerToJson(this);
}

@JsonSerializable()
class CartVendorProfile {
  final String avatar;
  CartVendorProfile({required this.avatar});
  factory CartVendorProfile.fromJson(Map<String, dynamic> json) =>
      _$CartVendorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$CartVendorProfileToJson(this);
}

@JsonSerializable()
class CartProduct {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final double? price;

  @JsonKey(
    defaultValue: CurrencySymbolsType.vnd,
    name: 'currencySymbol',
    fromJson: stringToCurrencySymbolsType,
    toJson: currencySymbolsTypeToString,
  )
  final CurrencySymbolsType currencySymbol;
  final StockModel2? stock;
  final double? discount;
  final Media media;
  final String? slug;
  final List<Variant>? variants;
  final String? variantLabel;
  final String? attributeLabel;
  final String? status;
  final List<ReviewModel>? reviews;

  CartProduct({
    required this.id,
    required this.name,
    this.price,
    required this.currencySymbol,
    this.stock,
    this.discount,
    required this.media,
    this.slug,
    this.variants,
    this.reviews,
    this.variantLabel,
    this.attributeLabel,
    this.status,
  });

  String? get urlProductThumbnail => media.featuredImage;

  String? get discountPercentFinal {
    if (discount == 0) return '0';
    return (discount! * 100).toStringAsFixed(0);
  }

  String? get getPrice {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    return currencyFormatter.format(price ?? 0);
  }

  double? get getPriceDicount {
    return ((price ?? 0) * (1 - discount!));
  }

  double? get getPriceDicountFinal {
    return ((price ?? 0) * (1 - discount!));
  }

  String? get getCurrentPrice {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    if (discount == 0) return currencyFormatter.format(price);
    return currencyFormatter.format((price ?? 0) * (1 - (discount ?? 0)));
  }
  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}

@JsonSerializable()
class PriceRange {
  final num min;
  final num max;
  PriceRange({required this.min, required this.max});

  factory PriceRange.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeFromJson(json);

  Map<String, dynamic> toJson() => _$PriceRangeToJson(this);
}

@JsonSerializable()
class CartDeleteResponse {
  final CartDocs? data;
  final int status;
  final String message;
  final String? error;
  CartDeleteResponse(
      {required this.status, required this.message, this.error, this.data});
  factory CartDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$CartDeleteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartDeleteResponseToJson(this);
}

@JsonSerializable()
class CartUpdateResponse {
  final CartDocs? data;
  final int status;
  final String message;
  final String? error;
  CartUpdateResponse(
      {this.data, required this.status, required this.message, this.error});
  factory CartUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$CartUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartUpdateResponseToJson(this);
}

@JsonSerializable()
class CartModel2 {
  @JsonKey(name: '_id')
  final String id;
  final String? note;
  final CartItem2 carts;

  CartModel2({
    required this.id,
    this.note,
    required this.carts,
  });

  factory CartModel2.fromJson(Map<String, dynamic> json) =>
      _$CartModel2FromJson(json);

  Map<String, dynamic> toJson() => _$CartModel2ToJson(this);
}

@JsonSerializable()
class CartItem2 {
  final Account vendor;
  final List<Product>? product;

  CartItem2({
    required this.vendor,
    this.product,
  });

  factory CartItem2.fromJson(Map<String, dynamic> json) =>
      _$CartItem2FromJson(json);

  Map<String, dynamic> toJson() => _$CartItem2ToJson(this);
}

@JsonSerializable()
class CartTotal {
  final CartTotalData? data;
  final int status;
  final String message;
  final String? error;
  CartTotal(
      {required this.status, required this.message, this.error, this.data});
  factory CartTotal.fromJson(Map<String, dynamic> json) =>
      _$CartTotalFromJson(json);

  Map<String, dynamic> toJson() => _$CartTotalToJson(this);
}

@JsonSerializable()
class CartTotalData {
  final int total;
  CartTotalData({required this.total});
  factory CartTotalData.fromJson(Map<String, dynamic> json) =>
      _$CartTotalDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartTotalDataToJson(this);
}
