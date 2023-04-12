// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutModel _$CheckoutModelFromJson(Map<String, dynamic> json) =>
    CheckoutModel(
      message: json['message'] as String,
      status: json['status'] as int,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : CheckoutData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutModelToJson(CheckoutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

CheckoutData _$CheckoutDataFromJson(Map<String, dynamic> json) => CheckoutData(
      grouped: (json['grouped'] as List<dynamic>)
          .map((e) => CheckoutGrouped.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalOrdersPrice: (json['totalOrdersPrice'] as num).toDouble(),
      defaultAddress: json['defaultAddress'] == null
          ? null
          : AddressDataResponse.fromJson(
              json['defaultAddress'] as Map<String, dynamic>),
      totalVoucherDiscount: (json['totalVoucherDiscount'] as num?)?.toDouble(),
      currencySymbol:
          stringToCurrencySymbolsType(json['currencySymbol'] as String),
      totalSystemDiscount: (json['totalSystemDiscount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CheckoutDataToJson(CheckoutData instance) =>
    <String, dynamic>{
      'currencySymbol': currencySymbolsTypeToString(instance.currencySymbol),
      'grouped': instance.grouped,
      'totalOrdersPrice': instance.totalOrdersPrice,
      'totalVoucherDiscount': instance.totalVoucherDiscount,
      'totalSystemDiscount': instance.totalSystemDiscount,
      'defaultAddress': instance.defaultAddress,
    };

CheckoutGrouped _$CheckoutGroupedFromJson(Map<String, dynamic> json) =>
    CheckoutGrouped(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartDocs.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      vendor: CartVendor.fromJson(json['vendor'] as Map<String, dynamic>),
      voucherDiscountAmount:
          (json['voucherDiscountAmount'] as num?)?.toDouble(),
      currencySymbol:
          stringToCurrencySymbolsType(json['currencySymbol'] as String),
      totalProducts: json['totalProducts'] as int?,
    );

Map<String, dynamic> _$CheckoutGroupedToJson(CheckoutGrouped instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'products': instance.products,
      'totalPrice': instance.totalPrice,
      'voucherDiscountAmount': instance.voucherDiscountAmount,
      'currencySymbol': currencySymbolsTypeToString(instance.currencySymbol),
      'totalProducts': instance.totalProducts,
    };

CheckoutCartItems _$CheckoutCartItemsFromJson(Map<String, dynamic> json) =>
    CheckoutCartItems(
      hasNextPage: json['hasNextPage'] as bool,
      hasPrevPage: json['hasPrevPage'] as bool,
      limit: json['limit'] as int,
      pagingCounter: json['pagingCounter'] as int,
      page: json['page'] as int,
      totalDocs: json['totalDocs'] as int,
      totalPages: json['totalPages'] as int,
      docs: (json['docs'] as List<dynamic>)
          .map((e) => CartDocs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutCartItemsToJson(CheckoutCartItems instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'pagingCounter': instance.pagingCounter,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
    };

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    CheckoutRequest(
      cartItemIds: (json['cartItemIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{
      'cartItemIds': instance.cartItemIds,
    };

PreVoucherRequest _$PreVoucherRequestFromJson(Map<String, dynamic> json) =>
    PreVoucherRequest(
      voucherIds: (json['voucherIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PreVoucherRequestToJson(PreVoucherRequest instance) =>
    <String, dynamic>{
      'voucherIds': instance.voucherIds,
    };

CheckoutResponse _$CheckoutResponseFromJson(Map<String, dynamic> json) =>
    CheckoutResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : CheckoutResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutResponseToJson(CheckoutResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

CheckoutResponseData _$CheckoutResponseDataFromJson(
        Map<String, dynamic> json) =>
    CheckoutResponseData(
      f: json['f'] as String,
      s: json['s'] as String,
    );

Map<String, dynamic> _$CheckoutResponseDataToJson(
        CheckoutResponseData instance) =>
    <String, dynamic>{
      's': instance.s,
      'f': instance.f,
    };

CheckoutCreate _$CheckoutCreateFromJson(Map<String, dynamic> json) =>
    CheckoutCreate(
      address: json['address'] as String,
      method: json['method'] as String,
      voucherIds: (json['voucherIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CheckoutCreateToJson(CheckoutCreate instance) =>
    <String, dynamic>{
      'address': instance.address,
      'voucherIds': instance.voucherIds,
      'method': instance.method,
    };
