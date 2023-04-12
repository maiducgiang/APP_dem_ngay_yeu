import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_gender.dart';
import 'package:mubaha/data/enums/enum_role.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String id;
  final UserProfileModel profile;
  final UserAuthenticationModel? authentication;
  final String phone;
  @JsonKey(
      name: 'type',
      fromJson: stringToRoleType,
      toJson: roleTypeToString,
      defaultValue: RoleType.customer)
  final RoleType type;
  final int? unreadNotifications;
  final String username;

  UserModel(
      {required this.id,
      required this.profile,
      required this.authentication,
      required this.phone,
      required this.type,
      this.unreadNotifications,
      required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserProfileModel {
  @JsonKey(
      name: 'gender',
      fromJson: stringToGenderType,
      toJson: genderTypeToString,
      defaultValue: GenderType.other)
  final GenderType gender;
  final String avatar;
  final String fullName;

  UserProfileModel(
      {required this.avatar, required this.gender, required this.fullName});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

@JsonSerializable()
class UserAuthenticationModel {
  final bool? lock;
  final bool? isChanged;
  final bool? status;
  final bool? isCreatedPassword;
  final bool? isPhoneVerified;

  UserAuthenticationModel(
      {this.lock,
      this.isChanged,
      this.status,
      this.isCreatedPassword,
      this.isPhoneVerified});

  factory UserAuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$UserAuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthenticationModelToJson(this);
}
