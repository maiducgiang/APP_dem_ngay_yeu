// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritePageResponse _$FavoritePageResponseFromJson(
        Map<String, dynamic> json) =>
    FavoritePageResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
    );

Map<String, dynamic> _$FavoritePageResponseToJson(
        FavoritePageResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };
