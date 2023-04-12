// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageResponse _$HomePageResponseFromJson(Map<String, dynamic> json) =>
    HomePageResponse(
      data: HomePageData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
    );

Map<String, dynamic> _$HomePageResponseToJson(HomePageResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

HomePageData _$HomePageDataFromJson(Map<String, dynamic> json) => HomePageData(
      listCategory: (json['listCategory'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      listDealsOfDay: (json['listDealsOfDay'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      listYourStyle: (json['listYourStyle'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      listKidsConner: (json['listKidsConner'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      listBrand: (json['listBrand'] as List<dynamic>)
          .map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList(),
      listVoucher: (json['listVoucher'] as List<dynamic>?)
          ?.map((e) => Voucher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageDataToJson(HomePageData instance) =>
    <String, dynamic>{
      'listCategory': instance.listCategory,
      'listDealsOfDay': instance.listDealsOfDay,
      'listYourStyle': instance.listYourStyle,
      'listKidsConner': instance.listKidsConner,
      'listBrand': instance.listBrand,
      'listVoucher': instance.listVoucher,
    };

HomePageResponse2 _$HomePageResponse2FromJson(Map<String, dynamic> json) =>
    HomePageResponse2(
      data: HomePageData2.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      errors: json['errors'] as String?,
      message: json['message'] as String,
    );

Map<String, dynamic> _$HomePageResponse2ToJson(HomePageResponse2 instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

HomePageData2 _$HomePageData2FromJson(Map<String, dynamic> json) =>
    HomePageData2(
      dealsOfTheDay: (json['dealsOfTheDay'] as List<dynamic>)
          .map((e) => Product2.fromJson(e as Map<String, dynamic>))
          .toList(),
      stylesOfMe: (json['stylesOfMe'] as List<dynamic>)
          .map((e) => Product2.fromJson(e as Map<String, dynamic>))
          .toList(),
      productsByCat: (json['productsByCat'] as List<dynamic>)
          .map((e) => Product2.fromJson(e as Map<String, dynamic>))
          .toList(),
      flashSales: (json['flashSales'] as List<dynamic>)
          .map((e) => Product2.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryHomepage.fromJson(e as Map<String, dynamic>))
          .toList(),
      brands: (json['brands'] as List<dynamic>?)
          ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageData2ToJson(HomePageData2 instance) =>
    <String, dynamic>{
      'brands': instance.brands,
      'dealsOfTheDay': instance.dealsOfTheDay,
      'stylesOfMe': instance.stylesOfMe,
      'productsByCat': instance.productsByCat,
      'flashSales': instance.flashSales,
      'categories': instance.categories,
    };
