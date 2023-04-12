// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['_id'] as String?,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      username: json['username'] as String?,
      phone: json['phone'] as String,
      password: json['password'] as String?,
      type: $enumDecodeNullable(_$RoleTypeEnumMap, json['type']),
      vendor: json['vendor'] == null
          ? null
          : VendorModel.fromJson(json['vendor'] as Map<String, dynamic>),
      authentication: json['authentication'] == null
          ? null
          : AuthenticationModel.fromJson(
              json['authentication'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      '_id': instance.id,
      'profile': instance.profile,
      'username': instance.username,
      'phone': instance.phone,
      'password': instance.password,
      'type': _$RoleTypeEnumMap[instance.type],
      'vendor': instance.vendor,
      'authentication': instance.authentication,
    };

const _$RoleTypeEnumMap = {
  RoleType.customer: 'customer',
  RoleType.vendor: 'vendor',
  RoleType.transporter: 'transporter',
  RoleType.admin: 'admin',
  RoleType.staff: 'staff',
  RoleType.supporter: 'supporter',
};

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'email': instance.email,
      'dob': instance.dob?.toIso8601String(),
    };

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) => VendorModel(
      cover: json['cover'] as String? ??
          'https://via.placeholder.com/1920x350.jpg?text=mubaha.com',
      description: json['description'] as String?,
      facebook: json['facebook'] as String?,
      youtube: json['youtube'] as String?,
      tiktok: json['tiktok'] as String?,
      instagram: json['instagram'] as String?,
    );

Map<String, dynamic> _$VendorModelToJson(VendorModel instance) =>
    <String, dynamic>{
      'cover': instance.cover,
      'description': instance.description,
      'facebook': instance.facebook,
      'youtube': instance.youtube,
      'tiktok': instance.tiktok,
      'instagram': instance.instagram,
    };

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      lock: json['lock'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      ip: json['ip'] as String?,
      recentSMSOTP: json['recentSMSOTP'] == null
          ? null
          : DateTime.parse(json['recentSMSOTP'] as String),
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        AuthenticationModel instance) =>
    <String, dynamic>{
      'lock': instance.lock,
      'status': instance.status,
      'ip': instance.ip,
      'recentSMSOTP': instance.recentSMSOTP?.toIso8601String(),
      'isPhoneVerified': instance.isPhoneVerified,
    };
