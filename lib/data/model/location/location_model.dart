import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final List<LocationData> data;
  final int status;
  final String message;
  final String? error;
  LocationModel(
      {required this.status,
      required this.message,
      this.error,
      required this.data});
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class LocationData {
  final String code;
  final String name;
  final String unit;
  final String? province_code;
  final String? district_code;
  final String? province_name;
  final String? district_name;
  final String? full_name;
  LocationData(
      {required this.code,
      required this.name,
      required this.unit,
      this.full_name,
      this.province_code,
      this.province_name,
      this.district_code,
      this.district_name});
  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}
