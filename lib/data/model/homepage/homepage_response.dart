import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/brand/brand.dart';
import 'package:mubaha/data/model/category/category.dart';
import 'package:mubaha/data/model/product/product.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/data/model/voucher/voucher.dart';

part 'homepage_response.g.dart';

@JsonSerializable()
class HomePageResponse {
  @JsonKey(name: 'data')
  final HomePageData data;
  final int status;

  HomePageResponse({
    required this.data,
    required this.status,
  });

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePageResponseFromJson(json);
}

@JsonSerializable()
class HomePageData {
  final List<Category> listCategory;
  final List<Product> listDealsOfDay;
  final List<Product> listYourStyle;
  final List<Product> listKidsConner;
  final List<Brand> listBrand;
  final List<Voucher>? listVoucher;

  HomePageData(
      {required this.listCategory,
      required this.listDealsOfDay,
      required this.listYourStyle,
      required this.listKidsConner,
      required this.listBrand,
      this.listVoucher});

  factory HomePageData.fromJson(Map<String, dynamic> json) =>
      _$HomePageDataFromJson(json);
}

@JsonSerializable()
class HomePageResponse2 {
  @JsonKey(name: 'data')
  final HomePageData2 data;
  final int status;
  final String message;
  final String? errors;

  HomePageResponse2(
      {required this.data,
      required this.status,
      this.errors,
      required this.message});

  factory HomePageResponse2.fromJson(Map<String, dynamic> json) =>
      _$HomePageResponse2FromJson(json);
}

@JsonSerializable()
class HomePageData2 {
  final List<Brand>? brands;
  final List<Product2> dealsOfTheDay;
  final List<Product2> stylesOfMe;
  final List<Product2> productsByCat;
  final List<Product2> flashSales;
  final List<CategoryHomepage> categories;

  HomePageData2(
      {required this.dealsOfTheDay,
      required this.stylesOfMe,
      required this.productsByCat,
      required this.flashSales,
      required this.categories,
      this.brands});

  factory HomePageData2.fromJson(Map<String, dynamic> json) =>
      _$HomePageData2FromJson(json);
}
