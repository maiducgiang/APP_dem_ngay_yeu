import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressResponseModel {
  final List<AddressDataResponse>? data;
  final int status;
  final String message;
  final String? error;
  AddressResponseModel(
      {required this.status, required this.message, this.error, this.data});
  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseModelToJson(this);
}

@JsonSerializable()
class AddressDataResponse {
  @JsonKey(name: "_id")
  final String id;
  final AddressCode codes;
  final AddressLocation location;
  final String? owner;
  final String phone;
  final String fullName;
  final String details;
  final bool isDeleted;
  bool isDefault;
  final String fullAddress;
  final String type;
  AddressDataResponse(
      {required this.id,
      required this.codes,
      required this.location,
      required this.details,
      required this.fullAddress,
      required this.fullName,
      required this.isDefault,
      required this.isDeleted,
      this.owner,
      required this.phone,
      required this.type});
  double get longtitude => location.coordinates[0];
  double get latitude => location.coordinates[1];
  factory AddressDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataResponseToJson(this);
}

@JsonSerializable()
class AddressCode {
  final String province;
  final String district;
  final String ward;
  AddressCode(
      {required this.district, required this.province, required this.ward});

  factory AddressCode.fromJson(Map<String, dynamic> json) =>
      _$AddressCodeFromJson(json);

  Map<String, dynamic> toJson() => _$AddressCodeToJson(this);
}

@JsonSerializable()
class AddressLocation {
  List<double> coordinates;
  AddressLocation({required this.coordinates});
  factory AddressLocation.fromJson(Map<String, dynamic> json) =>
      _$AddressLocationFromJson(json);

  Map<String, dynamic> toJson() => _$AddressLocationToJson(this);
}

@JsonSerializable()
class AddressRequest {
  final String fullName;
  final String phone;
  final String provinceCode;
  final String districtCode;
  final String wardCode;
  final String detailAddress;
  final String fullAddress;
  final bool isDefault;
  AddressRequest(
      {required this.detailAddress,
      required this.districtCode,
      required this.fullAddress,
      required this.fullName,
      this.isDefault = false,
      required this.phone,
      required this.provinceCode,
      required this.wardCode});
  factory AddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressRequestToJson(this);
}

@JsonSerializable()
class AddressResponseRequest {
  final AddressDataResponse? data;
  final int status;
  final String message;
  final String? error;
  AddressResponseRequest(
      {required this.status, required this.message, this.error, this.data});
  factory AddressResponseRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseRequestToJson(this);
}

@JsonSerializable()
class AddressResponseDelete {
  final List? data;
  final int status;
  final String message;
  final String? error;
  AddressResponseDelete(
      {required this.status, required this.message, this.error, this.data});
  factory AddressResponseDelete.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseDeleteToJson(this);
}
