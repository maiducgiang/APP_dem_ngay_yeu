// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      message: json['message'] as String,
      status: json['status'] as int,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : OrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
      'error': instance.error,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => OrderDocs.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasNextPage: json['hasNextPage'] as bool,
      hasPrevPage: json['hasPrevPage'] as bool,
      limit: json['limit'] as int,
      page: json['page'] as int,
      pagingCounter: json['pagingCounter'] as int,
      totalDocs: json['totalDocs'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'pagingCounter': instance.pagingCounter,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
    };

OrderDocs _$OrderDocsFromJson(Map<String, dynamic> json) => OrderDocs(
      id: json['_id'] as String,
      orderId: json['orderId'] as String,
      payment: OrderPayment.fromJson(json['payment'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => CartDocs.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipmentMethod: OrderShipmentMethod.fromJson(
          json['shipmentMethod'] as Map<String, dynamic>),
      status: json['status'] as String?,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      transaction: json['transaction'] as String?,
      usedVouchers: (json['usedVouchers'] as List<dynamic>?)
          ?.map((e) => OrderVoucher.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendor: CartVendor.fromJson(json['vendor'] as Map<String, dynamic>),
      deliveryAddress: AddressDataResponse.fromJson(
          json['deliveryAddress'] as Map<String, dynamic>),
      proccessingInfo: json['proccessingInfo'] == null
          ? null
          : OrderProccessingInfo.fromJson(
              json['proccessingInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDocsToJson(OrderDocs instance) => <String, dynamic>{
      '_id': instance.id,
      'shipmentMethod': instance.shipmentMethod,
      'payment': instance.payment,
      'products': instance.products,
      'vendor': instance.vendor,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'transaction': instance.transaction,
      'orderId': instance.orderId,
      'usedVouchers': instance.usedVouchers,
      'deliveryAddress': instance.deliveryAddress,
      'proccessingInfo': instance.proccessingInfo,
    };

OrderProccessingInfo _$OrderProccessingInfoFromJson(
        Map<String, dynamic> json) =>
    OrderProccessingInfo(
      orderAt: DateTime.parse(json['orderAt'] as String),
      paymentAt: json['paymentAt'] == null
          ? null
          : DateTime.parse(json['paymentAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      pickupAt: json['pickupAt'] == null
          ? null
          : DateTime.parse(json['pickupAt'] as String),
      cancelAt: json['cancelAt'] == null
          ? null
          : DateTime.parse(json['cancelAt'] as String),
      intransitAt: json['intransitAt'] == null
          ? null
          : DateTime.parse(json['intransitAt'] as String),
    );

Map<String, dynamic> _$OrderProccessingInfoToJson(
        OrderProccessingInfo instance) =>
    <String, dynamic>{
      'paymentAt': instance.paymentAt?.toIso8601String(),
      'orderAt': instance.orderAt.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'pickupAt': instance.pickupAt?.toIso8601String(),
      'cancelAt': instance.cancelAt?.toIso8601String(),
      'intransitAt': instance.intransitAt?.toIso8601String(),
    };

OrderShipmentMethod _$OrderShipmentMethodFromJson(Map<String, dynamic> json) =>
    OrderShipmentMethod(
      id: json['_id'] as String,
      name: json['name'] as String,
      type: stringToShipmentType(json['type'] as String),
    );

Map<String, dynamic> _$OrderShipmentMethodToJson(
        OrderShipmentMethod instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': shipmentTypeToString(instance.type),
      'name': instance.name,
    };

OrderShipmentDetails _$OrderShipmentDetailsFromJson(
        Map<String, dynamic> json) =>
    OrderShipmentDetails(
      id: json['_id'] as String,
      note: json['note'] as String?,
      processedAt: DateTime.parse(json['processedAt'] as String),
      shipment: json['shipment'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$OrderShipmentDetailsToJson(
        OrderShipmentDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'shipment': instance.shipment,
      'title': instance.title,
      'note': instance.note,
      'processedAt': instance.processedAt.toIso8601String(),
    };

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) => OrderPayment(
      method: json['method'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$OrderPaymentToJson(OrderPayment instance) =>
    <String, dynamic>{
      'method': instance.method,
      'status': instance.status,
    };

OrderVoucher _$OrderVoucherFromJson(Map<String, dynamic> json) => OrderVoucher(
      amount: json['amount'] as int?,
      id: json['_id'] as String,
      maxVoucherAmount: (json['maxVoucherAmount'] as num).toDouble(),
      minBasketPrice: (json['minBasketPrice'] as num).toDouble(),
      title: json['title'] as String,
      type: json['type'] as String,
      voucher: json['voucher'] as String,
    );

Map<String, dynamic> _$OrderVoucherToJson(OrderVoucher instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'voucher': instance.voucher,
      'title': instance.title,
      'type': instance.type,
      'amount': instance.amount,
      'minBasketPrice': instance.minBasketPrice,
      'maxVoucherAmount': instance.maxVoucherAmount,
    };

OrderDeleteResponse _$OrderDeleteResponseFromJson(Map<String, dynamic> json) =>
    OrderDeleteResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : OrderDeleteData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDeleteResponseToJson(
        OrderDeleteResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

OrderDeleteData _$OrderDeleteDataFromJson(Map<String, dynamic> json) =>
    OrderDeleteData(
      id: json['_id'] as String,
    );

Map<String, dynamic> _$OrderDeleteDataToJson(OrderDeleteData instance) =>
    <String, dynamic>{
      '_id': instance.id,
    };

OrderDeleteRequest _$OrderDeleteRequestFromJson(Map<String, dynamic> json) =>
    OrderDeleteRequest(
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$OrderDeleteRequestToJson(OrderDeleteRequest instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      data: json['data'] == null
          ? null
          : OrderDocs.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as int,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };
