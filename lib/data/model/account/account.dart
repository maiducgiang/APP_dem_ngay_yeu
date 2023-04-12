import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_role.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: '_id')
  final String? id;
  final Profile profile;
  final String? username;
  final String phone;
  final String? password;
  // @JsonKey(
  //   name: 'type',
  //   fromJson: stringToRoleType,
  //   toJson: roleTypeToString,
  // )
  final RoleType? type;
  final VendorModel? vendor;
  final AuthenticationModel? authentication;

  Account(
      {this.id,
      required this.profile,
      this.username,
      required this.phone,
      this.password,
      this.type,
      this.vendor,
      this.authentication});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable()
class Profile {
  final String? fullName;
  final String? avatar;
  final String? email;
  final DateTime? dob;
  // @JsonKey(
  //   name: 'gender',
  //   fromJson: stringToGenderType,
  //   toJson: genderTypeToString,
  // )
  // final GenderType? gender;

  Profile({this.fullName, this.avatar, this.email, this.dob});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class VendorModel {
  @JsonKey(
      name: 'cover',
      defaultValue: "https://via.placeholder.com/1920x350.jpg?text=mubaha.com")
  final String cover;
  final String? description;
  final String? facebook;
  final String? youtube;
  final String? tiktok;
  final String? instagram;

  VendorModel(
      {required this.cover,
      this.description,
      this.facebook,
      this.youtube,
      this.tiktok,
      this.instagram});

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);
}

@JsonSerializable()
class AuthenticationModel {
  @JsonKey(name: 'lock', defaultValue: false)
  final bool? lock;
  @JsonKey(name: 'status', defaultValue: false)
  final bool? status;
  final String? ip;
  final DateTime? recentSMSOTP;
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  final bool isPhoneVerified;

  AuthenticationModel({
    this.lock,
    this.status,
    this.ip,
    this.recentSMSOTP,
    required this.isPhoneVerified,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);
}
