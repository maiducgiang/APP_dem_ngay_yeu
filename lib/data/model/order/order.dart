import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_shipment_type.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderModel {
  final OrderData? data;
  final String message;
  final int status;
  final String? error;
  OrderModel(
      {required this.message, required this.status, this.error, this.data});
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderData {
  List<OrderDocs>? docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  OrderData(
      {this.docs,
      required this.hasNextPage,
      required this.hasPrevPage,
      required this.limit,
      required this.page,
      required this.pagingCounter,
      required this.totalDocs,
      required this.totalPages});

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

@JsonSerializable()
class OrderDocs {
  @JsonKey(name: '_id')
  final String id;
  final OrderShipmentMethod shipmentMethod;
  final OrderPayment payment;
  final List<CartDocs> products;
  final CartVendor vendor;
  final double totalPrice;
  final String? status;
  final String? transaction;
  final String orderId;
  final List<OrderVoucher>? usedVouchers;
  final AddressDataResponse deliveryAddress;
  final OrderProccessingInfo? proccessingInfo;
  OrderDocs(
      {required this.id,
      required this.orderId,
      required this.payment,
      required this.products,
      required this.shipmentMethod,
      this.status,
      required this.totalPrice,
      this.transaction,
      this.usedVouchers,
      required this.vendor,
      required this.deliveryAddress,
      this.proccessingInfo});
  String? get getTotalPrice {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    return currencyFormatter.format(totalPrice);
  }

  factory OrderDocs.fromJson(Map<String, dynamic> json) =>
      _$OrderDocsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDocsToJson(this);
}

@JsonSerializable()
class OrderProccessingInfo {
  final DateTime? paymentAt;
  final DateTime orderAt;
  final DateTime? deliveredAt;
  final DateTime? pickupAt;
  final DateTime? cancelAt;
  final DateTime? intransitAt;

  OrderProccessingInfo(
      {required this.orderAt,
      this.paymentAt,
      this.deliveredAt,
      this.pickupAt,
      this.cancelAt,
      this.intransitAt});

  factory OrderProccessingInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderProccessingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProccessingInfoToJson(this);
}

// @JsonSerializable()
// class OrderShipment {
//   final AddressDataResponse customerAddress;
//   final AddressDataResponse vendorAddress;
//   final String status;
//   final String shipmentId;
//   final OrderShipmentMethod? method;
//   final List<OrderShipmentDetails>? details;
//   OrderShipment(
//       {required this.customerAddress,
//       required this.vendorAddress,
//       required this.status,
//       this.method,
//       required this.shipmentId,
//       this.details});
//   factory OrderShipment.fromJson(Map<String, dynamic> json) =>
//       _$OrderShipmentFromJson(json);

//   Map<String, dynamic> toJson() => _$OrderShipmentToJson(this);
// }

@JsonSerializable()
class OrderShipmentMethod {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(
    name: 'type',
    fromJson: stringToShipmentType,
    toJson: shipmentTypeToString,
  )
  final ShipmentType type;
  final String name;

  OrderShipmentMethod(
      {required this.id, required this.name, required this.type});
  factory OrderShipmentMethod.fromJson(Map<String, dynamic> json) =>
      _$OrderShipmentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$OrderShipmentMethodToJson(this);
}

@JsonSerializable()
class OrderShipmentDetails {
  @JsonKey(name: '_id')
  final String id;
  final String shipment;
  final String title;
  final String? note;
  final DateTime processedAt;

  OrderShipmentDetails(
      {required this.id,
      this.note,
      required this.processedAt,
      required this.shipment,
      required this.title});
  factory OrderShipmentDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderShipmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderShipmentDetailsToJson(this);
}

@JsonSerializable()
class OrderPayment {
  final String method;
  final String status;
  OrderPayment({required this.method, required this.status});
  factory OrderPayment.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPaymentToJson(this);
}

@JsonSerializable()
class OrderVoucher {
  @JsonKey(name: '_id')
  final String id;
  final String voucher;
  final String title;
  final String type;
  final int? amount;
  final double minBasketPrice;
  final double maxVoucherAmount;
  OrderVoucher(
      {this.amount,
      required this.id,
      required this.maxVoucherAmount,
      required this.minBasketPrice,
      required this.title,
      required this.type,
      required this.voucher});
  factory OrderVoucher.fromJson(Map<String, dynamic> json) =>
      _$OrderVoucherFromJson(json);

  Map<String, dynamic> toJson() => _$OrderVoucherToJson(this);
}

@JsonSerializable()
class OrderDeleteResponse {
  final OrderDeleteData? data;
  final int status;
  final String message;
  final String? error;
  OrderDeleteResponse(
      {required this.status, required this.message, this.error, this.data});
  factory OrderDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDeleteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDeleteResponseToJson(this);
}

@JsonSerializable()
class OrderDeleteData {
  @JsonKey(name: '_id')
  final String id;

  OrderDeleteData({required this.id});
  factory OrderDeleteData.fromJson(Map<String, dynamic> json) =>
      _$OrderDeleteDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDeleteDataToJson(this);
}

@JsonSerializable()
class OrderDeleteRequest {
  final String reason;

  OrderDeleteRequest({required this.reason});
  factory OrderDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderDeleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDeleteRequestToJson(this);
}

@JsonSerializable()
class OrderDetail {
  final OrderDocs? data;
  final int status;
  final String message;
  final String? error;
  OrderDetail(
      {this.data, required this.message, required this.status, this.error});
  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
