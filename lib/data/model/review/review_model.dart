import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/account/account.dart';
import 'package:mubaha/data/model/brand/brand.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  @JsonKey(name: '_id')
  final String id;
  final String content;
  final Account reviewer;
  final double rating;
  final List<Media>? gallery;
  final String? product;
  final String? createdAt;
  final String? updatedAt;

  ReviewModel({
    required this.id,
    required this.content,
    required this.reviewer,
    required this.rating,
    this.product,
    this.gallery,
    this.createdAt,
    this.updatedAt,
  });

  String? get createAtFormat {
    final timeDateFormat = DateFormat("yyyy-MM-dd").parse(createdAt!);
    final timeStringFormat = DateFormat("dd/MM/yyyy").format(timeDateFormat);
    return timeStringFormat;
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
