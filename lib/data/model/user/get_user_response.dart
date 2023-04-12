import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/user/user_model.dart';

part 'get_user_response.g.dart';

@JsonSerializable()
class GetUserResponse {
  @JsonKey(name: 'data')
  final GetUserData? data;
  final int status;
  final String message;
  final String? error;
  GetUserResponse(
      {this.data, required this.status, required this.message, this.error});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}

@JsonSerializable()
class GetUserData {
  final UserModel? account;

  GetUserData({this.account});

  factory GetUserData.fromJson(Map<String, dynamic> json) =>
      _$GetUserDataFromJson(json);
}
