// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) =>
    GetUserResponse(
      data: json['data'] == null
          ? null
          : GetUserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$GetUserResponseToJson(GetUserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

GetUserData _$GetUserDataFromJson(Map<String, dynamic> json) => GetUserData(
      account: json['account'] == null
          ? null
          : UserModel.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDataToJson(GetUserData instance) =>
    <String, dynamic>{
      'account': instance.account,
    };
