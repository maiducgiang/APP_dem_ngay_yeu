import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/brand/brand.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String? id;
  final String name;
  final String? description;
  final CategoryParents? parents;
  final Media? media;
  final String? featuredImage;
  final bool? isDeleted;

  Category(
      {this.id,
      required this.name,
      this.description,
      this.media,
      this.parents,
      this.featuredImage,
      this.isDeleted});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryParents {
  // final Category? firstLevel;
  final String? firstLevel;

  final String? secondLevel;

  CategoryParents({
    this.firstLevel,
    this.secondLevel,
  });

  factory CategoryParents.fromJson(Map<String, dynamic> json) =>
      _$CategoryParentsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryParentsToJson(this);
}

@JsonSerializable()
class CategoryHomepage {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String featuredImage;
  CategoryHomepage(
      {required this.id,
      required this.name,
      required this.slug,
      required this.featuredImage});
  factory CategoryHomepage.fromJson(Map<String, dynamic> json) =>
      _$CategoryHomepageFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryHomepageToJson(this);
}

// @JsonSerializable()
// class ChildrensCategory {
//   @JsonKey(name: '_id')
//   final String id;
//   final String name;
//   final String slug;
//   final List<ChildsCategory> childs;
//   ChildrensCategory(
//       {required this.id,
//       required this.name,
//       required this.slug,
//       required this.childs});
//   factory ChildrensCategory.fromJson(Map<String, dynamic> json) =>
//       _$ChildrensCategoryFromJson(json);

//   Map<String, dynamic> toJson() => _$ChildrensCategoryToJson(this);
// }

// @JsonSerializable()
// class ChildsCategory {
//   @JsonKey(name: '_id')
//   final String id;
//   final String name;
//   final String slug;
//   ChildsCategory({required this.id, required this.name, required this.slug});
//   factory ChildsCategory.fromJson(Map<String, dynamic> json) =>
//       _$ChildsCategoryFromJson(json);

//   Map<String, dynamic> toJson() => _$ChildsCategoryToJson(this);
// }
