import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/media/media.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  final String? id;
  final String name;
  final String? description;
  final Media? media;

  Brand({
    this.id,
    required this.name,
    this.description,
    this.media,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Brand2 {
  @JsonKey(name: '_id')
  final String? id;
  final String name;
  final String? description;
  final Media2? media;

  Brand2({
    this.id,
    required this.name,
    this.description,
    this.media,
  });

  factory Brand2.fromJson(Map<String, dynamic> json) => _$Brand2FromJson(json);

  Map<String, dynamic> toJson() => _$Brand2ToJson(this);
}

@JsonSerializable()
class Media {
  @JsonKey(
      name: 'featuredImage',
      defaultValue: "https://via.placeholder.com/300x300.jpg?text=mubaha.com")
  final String featuredImage;
  // final List<MediaModel>? data;
  final List<DataMedia>? data;

  Media({
    required this.featuredImage,
    this.data,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class Media2 {
  @JsonKey(
      name: 'featuredImage',
      defaultValue: "https://via.placeholder.com/300x300.jpg?text=mubaha.com")
  final String featuredImage;
  final List<String>? data;

  Media2({
    required this.featuredImage,
    this.data,
  });

  factory Media2.fromJson(Map<String, dynamic> json) => _$Media2FromJson(json);

  Map<String, dynamic> toJson() => _$Media2ToJson(this);
}

@JsonSerializable()
class DataMedia {
  @JsonKey(name: '_id')
  final String id;
  final String path;
  final String type;

  DataMedia({required this.id, required this.path, required this.type});
  factory DataMedia.fromJson(Map<String, dynamic> json) =>
      _$DataMediaFromJson(json);

  Map<String, dynamic> toJson() => _$DataMediaToJson(this);
}
