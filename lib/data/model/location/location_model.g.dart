// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => LocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      code: json['code'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      full_name: json['full_name'] as String?,
      province_code: json['province_code'] as String?,
      province_name: json['province_name'] as String?,
      district_code: json['district_code'] as String?,
      district_name: json['district_name'] as String?,
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'unit': instance.unit,
      'province_code': instance.province_code,
      'district_code': instance.district_code,
      'province_name': instance.province_name,
      'district_name': instance.district_name,
      'full_name': instance.full_name,
    };
