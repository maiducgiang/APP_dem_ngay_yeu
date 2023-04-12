import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/category/category.dart';

part 'categorypage_response.g.dart';

@JsonSerializable()
class CategoryPageResponse {
  @JsonKey(name: 'data')
  final List<Category> data;
  final int status;

  CategoryPageResponse({
    required this.data,
    required this.status,
  });

  factory CategoryPageResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryPageResponseFromJson(json);
}
