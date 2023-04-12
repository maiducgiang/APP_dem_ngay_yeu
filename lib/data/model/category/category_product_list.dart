import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/enum_currency_symbols.dart';
import '../product/product2.dart';
import '../product/product4.dart';
part 'category_product_list.g.dart';
@JsonSerializable()
class CategoryProductList {
  final CategoryInformation? data;
  final int status;
  final String? message;
  final String? errors;

  CategoryProductList({
    this.data,
    required this.status,
    this.message,
    this.errors,
  });

  factory CategoryProductList.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductListToJson(this);
}

@JsonSerializable()
class CategoryInformation {
  // final Category? firstLevel;
  final CategoryDetail category;

  final Product3 products;

  CategoryInformation({
    required this.category,
    required this.products,
  });

  factory CategoryInformation.fromJson(Map<String, dynamic> json) =>
      _$CategoryInformationFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryInformationToJson(this);
}

@JsonSerializable()
class CategoryDetail {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String featuredImage;
  final String? description;
  final bool isDeleted;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ChildCategories>? childCategories;
  CategoryDetail({
    required this.id,
    required this.name,
    required this.featuredImage,
     this.description,
    required this.isDeleted,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
     this.childCategories,
  });
  factory CategoryDetail.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailToJson(this);
}

@JsonSerializable()
class ChildCategories {
  final Parents parents;
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String featuredImage;
  final String? description;
  final bool isDeleted;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  ChildCategories({
    required this.parents,
    required this.id,
    required this.name,
    required this.featuredImage,
    required this.description,
    required this.isDeleted,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });
  factory ChildCategories.fromJson(Map<String, dynamic> json) =>
      _$ChildCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$ChildCategoriesToJson(this);
}

@JsonSerializable()
class Parents {
  final String firstLevel;
  Parents({
    required this.firstLevel,
  });
  factory Parents.fromJson(Map<String, dynamic> json) =>
      _$ParentsFromJson(json);

  Map<String, dynamic> toJson() => _$ParentsToJson(this);
}

@JsonSerializable()
class Product3 {
  final List<Product4>? docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? prevPage;
  final int? nextPage;
  Product3({
     this.docs,
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });
  factory Product3.fromJson(Map<String, dynamic> json) =>
      _$Product3FromJson(json);

  Map<String, dynamic> toJson() => _$Product3ToJson(this);
}


@JsonSerializable()
class Stock2 {
  final String country;
  Stock2({
    required this.country,
  });
  factory Stock2.fromJson(Map<String, dynamic> json) =>
      _$Stock2FromJson(json);

  Map<String, dynamic> toJson() => _$Stock2ToJson(this);
}

