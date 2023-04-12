// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      media: json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'media': instance.media,
    };

Brand2 _$Brand2FromJson(Map<String, dynamic> json) => Brand2(
      id: json['_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      media: json['media'] == null
          ? null
          : Media2.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Brand2ToJson(Brand2 instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      featuredImage: json['featuredImage'] as String? ??
          'https://via.placeholder.com/300x300.jpg?text=mubaha.com',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'featuredImage': instance.featuredImage,
      'data': instance.data,
    };

Media2 _$Media2FromJson(Map<String, dynamic> json) => Media2(
      featuredImage: json['featuredImage'] as String? ??
          'https://via.placeholder.com/300x300.jpg?text=mubaha.com',
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$Media2ToJson(Media2 instance) => <String, dynamic>{
      'featuredImage': instance.featuredImage,
      'data': instance.data,
    };

DataMedia _$DataMediaFromJson(Map<String, dynamic> json) => DataMedia(
      id: json['_id'] as String,
      path: json['path'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DataMediaToJson(DataMedia instance) => <String, dynamic>{
      '_id': instance.id,
      'path': instance.path,
      'type': instance.type,
    };
