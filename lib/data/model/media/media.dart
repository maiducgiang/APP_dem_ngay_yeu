import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_gender.dart';

part 'media.g.dart';

@JsonSerializable()
class MediaModel {
  final String? title;
  @JsonKey(
    name: 'type',
    fromJson: stringToGenderType,
    toJson: genderTypeToString,
  )
  final GenderType type;
  final String path;

  MediaModel({this.title, required this.type, required this.path});

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}
