// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductList _$CategoryProductListFromJson(Map<String, dynamic> json) =>
    CategoryProductList(
      data: json['data'] == null
          ? null
          : CategoryInformation.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      message: json['message'] as String?,
      errors: json['errors'] as String?,
    );

Map<String, dynamic> _$CategoryProductListToJson(
        CategoryProductList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CategoryInformation _$CategoryInformationFromJson(Map<String, dynamic> json) =>
    CategoryInformation(
      category:
          CategoryDetail.fromJson(json['category'] as Map<String, dynamic>),
      products: Product3.fromJson(json['products'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryInformationToJson(
        CategoryInformation instance) =>
    <String, dynamic>{
      'category': instance.category,
      'products': instance.products,
    };

CategoryDetail _$CategoryDetailFromJson(Map<String, dynamic> json) =>
    CategoryDetail(
      id: json['_id'] as String,
      name: json['name'] as String,
      featuredImage: json['featuredImage'] as String,
      description: json['description'] as String?,
      isDeleted: json['isDeleted'] as bool,
      slug: json['slug'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      childCategories: (json['childCategories'] as List<dynamic>?)
          ?.map((e) => ChildCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDetailToJson(CategoryDetail instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'featuredImage': instance.featuredImage,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'slug': instance.slug,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'childCategories': instance.childCategories,
    };

ChildCategories _$ChildCategoriesFromJson(Map<String, dynamic> json) =>
    ChildCategories(
      parents: Parents.fromJson(json['parents'] as Map<String, dynamic>),
      id: json['_id'] as String,
      name: json['name'] as String,
      featuredImage: json['featuredImage'] as String,
      description: json['description'] as String?,
      isDeleted: json['isDeleted'] as bool,
      slug: json['slug'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ChildCategoriesToJson(ChildCategories instance) =>
    <String, dynamic>{
      'parents': instance.parents,
      '_id': instance.id,
      'name': instance.name,
      'featuredImage': instance.featuredImage,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'slug': instance.slug,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

Parents _$ParentsFromJson(Map<String, dynamic> json) => Parents(
      firstLevel: json['firstLevel'] as String,
    );

Map<String, dynamic> _$ParentsToJson(Parents instance) => <String, dynamic>{
      'firstLevel': instance.firstLevel,
    };

Product3 _$Product3FromJson(Map<String, dynamic> json) => Product3(
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => Product4.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocs: json['totalDocs'] as int,
      limit: json['limit'] as int,
      totalPages: json['totalPages'] as int,
      page: json['page'] as int,
      pagingCounter: json['pagingCounter'] as int,
      hasPrevPage: json['hasPrevPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$Product3ToJson(Product3 instance) => <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'pagingCounter': instance.pagingCounter,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };

Stock2 _$Stock2FromJson(Map<String, dynamic> json) => Stock2(
      country: json['country'] as String,
    );

Map<String, dynamic> _$Stock2ToJson(Stock2 instance) => <String, dynamic>{
      'country': instance.country,
    };
