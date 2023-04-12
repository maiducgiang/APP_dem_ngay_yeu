import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/order/order.dart';

part 'shipment.g.dart';

@JsonSerializable()
class ShipmentModel {
  final ShipmentData? data;
  final String message;
  final int status;
  final String? error;
  ShipmentModel(
      {required this.message, required this.status, this.error, this.data});
  factory ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentModelToJson(this);
}

@JsonSerializable()
class ShipmentData {
  @JsonKey(name: '_id')
  final String id;
  final OrderProccessingInfo proccessingInfo;
  final OrderShipmentMethod shipmentMethod;
  final Shipment shipment;
  ShipmentData(
      {required this.id,
      required this.proccessingInfo,
      required this.shipment,
      required this.shipmentMethod});
  factory ShipmentData.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentDataToJson(this);
}

@JsonSerializable()
class Shipment {
  @JsonKey(name: '_id')
  final String id;
  final String status;
  final String shipmentId;
  final List<ShipmentDetails> details;
  Shipment(
      {required this.id,
      required this.shipmentId,
      required this.status,
      required this.details});
  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentToJson(this);
}

@JsonSerializable()
class ShipmentDetails {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final String? note;
  final DateTime processedAt;
  final String shipment;
  ShipmentDetails(
      {required this.id,
      this.note,
      required this.processedAt,
      required this.shipment,
      required this.title});
  factory ShipmentDetails.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentDetailsToJson(this);
}
