// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String,
      profile:
          UserProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      authentication: json['authentication'] == null
          ? null
          : UserAuthenticationModel.fromJson(
              json['authentication'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      type: json['type'] == null
          ? RoleType.customer
          : stringToRoleType(json['type'] as String),
      unreadNotifications: json['unreadNotifications'] as int?,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'profile': instance.profile,
      'authentication': instance.authentication,
      'phone': instance.phone,
      'type': roleTypeToString(instance.type),
      'unreadNotifications': instance.unreadNotifications,
      'username': instance.username,
    };

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      avatar: json['avatar'] as String,
      gender: json['gender'] == null
          ? GenderType.other
          : stringToGenderType(json['gender'] as String),
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'gender': genderTypeToString(instance.gender),
      'avatar': instance.avatar,
      'fullName': instance.fullName,
    };

UserAuthenticationModel _$UserAuthenticationModelFromJson(
        Map<String, dynamic> json) =>
    UserAuthenticationModel(
      lock: json['lock'] as bool?,
      isChanged: json['isChanged'] as bool?,
      status: json['status'] as bool?,
      isCreatedPassword: json['isCreatedPassword'] as bool?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
    );

Map<String, dynamic> _$UserAuthenticationModelToJson(
        UserAuthenticationModel instance) =>
    <String, dynamic>{
      'lock': instance.lock,
      'isChanged': instance.isChanged,
      'status': instance.status,
      'isCreatedPassword': instance.isCreatedPassword,
      'isPhoneVerified': instance.isPhoneVerified,
    };
