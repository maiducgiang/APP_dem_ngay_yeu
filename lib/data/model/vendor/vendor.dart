import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/product/product2.dart';

part 'vendor.g.dart';

@JsonSerializable()
class VendorResponse {
  final VendorData data;
  final int status;
  final String message;
  final String? errors;
  VendorResponse(
      {required this.data,
      required this.status,
      required this.message,
      this.errors});
  factory VendorResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorResponseFromJson(json);
}

@JsonSerializable()
class VendorData {
  final Vendor vendor;
  final List<Product2> dealsOfTheDay;
  final List<Product2> flashSales;
  final List<Product2> suggestedForYou;
  VendorData(
      {required this.vendor,
      required this.dealsOfTheDay,
      required this.flashSales,
      required this.suggestedForYou});
  factory VendorData.fromJson(Map<String, dynamic> json) =>
      _$VendorDataFromJson(json);
}

@JsonSerializable()
class Vendor {
  @JsonKey(name: '_id')
  final String id;
  final String details;
  final String owner;
  final String cover;
  final bool active;
  final String brandName;
  final List gallery;
  final SocialLinks socialLinks;
  final String avatar;
  final String? banner;
  final double ratingOverall;
  final int followers;
  final int responseRate;

  Vendor(
      {required this.id,
      required this.details,
      required this.owner,
      required this.cover,
      required this.active,
      required this.brandName,
      required this.gallery,
      required this.socialLinks,
      required this.avatar,
      this.banner,
      required this.followers,
      required this.ratingOverall,
      required this.responseRate});
  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}

@JsonSerializable()
class SocialLinks {
  final String facebook;
  final String youtube;
  final String tiktok;
  final String instagram;
  SocialLinks(
      {required this.facebook,
      required this.youtube,
      required this.tiktok,
      required this.instagram});
  factory SocialLinks.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksFromJson(json);
}
