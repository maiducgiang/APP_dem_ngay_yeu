import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/user/user_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final LoginData? data;
  final int status;
  final String message;
  final String? error;
  LoginResponse(
      {this.data, this.error, required this.message, required this.status});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final String token;
  final String userId;
  final UserModel account;
  LoginData({required this.token, required this.userId, required this.account});
  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginRequest {
  final String? phone;
  final String? password;
  final String? fullName;
  final String? email;
  final String? code;
  LoginRequest(
      {this.phone, this.password, this.email, this.fullName, this.code});
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LogoutResponse {
  final String? data;
  final int status;
  final String message;
  final String? error;
  LogoutResponse(
      {this.data, this.error, required this.message, required this.status});
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
