import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/enums/enum_currency_symbols.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';

part 'checkout.g.dart';

@JsonSerializable()
class CheckoutModel {
  final CheckoutData? data;
  final int status;
  final String message;
  final String? error;
  CheckoutModel(
      {required this.message, required this.status, this.error, this.data});
  factory CheckoutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutModelToJson(this);
}

@JsonSerializable()
class CheckoutData {
  @JsonKey(
    name: 'currencySymbol',
    fromJson: stringToCurrencySymbolsType,
    toJson: currencySymbolsTypeToString,
  )
  final CurrencySymbolsType currencySymbol;
  List<CheckoutGrouped> grouped;
  double totalOrdersPrice;
  double? totalVoucherDiscount;
  double? totalSystemDiscount;
  final AddressDataResponse? defaultAddress;
  CheckoutData(
      {required this.grouped,
      required this.totalOrdersPrice,
      this.defaultAddress,
      this.totalVoucherDiscount,
      required this.currencySymbol,
      this.totalSystemDiscount});

  String get totalOrdersPriceFormat {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(totalOrdersPrice);
  }

  String get totalVoucherDiscountFormat {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(totalVoucherDiscount ?? 0);
  }

  String get totalSystemDiscountFormat {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(totalSystemDiscount ?? 0);
  }

  factory CheckoutData.fromJson(Map<String, dynamic> json) =>
      _$CheckoutDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutDataToJson(this);
}

@JsonSerializable()
class CheckoutGrouped {
  final CartVendor vendor;
  final List<CartDocs>? products;
  double totalPrice;
  double? voucherDiscountAmount;
  @JsonKey(
    name: 'currencySymbol',
    fromJson: stringToCurrencySymbolsType,
    toJson: currencySymbolsTypeToString,
  )
  final CurrencySymbolsType currencySymbol;
  final int? totalProducts;
  String? get getTotalPrice {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(totalPrice);
  }

  String? get getVoucherDiscountAmount {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(voucherDiscountAmount ?? 0);
  }

  CheckoutGrouped(
      {required this.products,
      required this.totalPrice,
      required this.vendor,
      this.voucherDiscountAmount,
      required this.currencySymbol,
      this.totalProducts});
  factory CheckoutGrouped.fromJson(Map<String, dynamic> json) =>
      _$CheckoutGroupedFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutGroupedToJson(this);
}

@JsonSerializable()
class CheckoutCartItems {
  final List<CartDocs> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  CheckoutCartItems(
      {required this.hasNextPage,
      required this.hasPrevPage,
      required this.limit,
      required this.pagingCounter,
      required this.page,
      required this.totalDocs,
      required this.totalPages,
      required this.docs});
  factory CheckoutCartItems.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutCartItemsToJson(this);
}

@JsonSerializable()
class CheckoutRequest {
  final List<String> cartItemIds;
  CheckoutRequest({required this.cartItemIds});
  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);
}

@JsonSerializable()
class PreVoucherRequest {
  final List<String> voucherIds;
  PreVoucherRequest({required this.voucherIds});
  factory PreVoucherRequest.fromJson(Map<String, dynamic> json) =>
      _$PreVoucherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PreVoucherRequestToJson(this);
}

@JsonSerializable()
class CheckoutResponse {
  final CheckoutResponseData? data;
  final int status;
  final String message;
  final String? error;
  CheckoutResponse(
      {required this.status, required this.message, this.error, this.data});
  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);
}

@JsonSerializable()
class CheckoutResponseData {
  final String s;
  final String f;
  CheckoutResponseData({required this.f, required this.s});
  factory CheckoutResponseData.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseDataToJson(this);
}

@JsonSerializable()
class CheckoutCreate {
  final String address;
  final List<String> voucherIds;
  final String method;
  CheckoutCreate(
      {required this.address, required this.method, required this.voucherIds});
  factory CheckoutCreate.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCreateFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutCreateToJson(this);
}
