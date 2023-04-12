import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/user/user_model.dart';

part 'user_session.g.dart';

@JsonSerializable()
class UserSession {
  final String token;
  final String userId;
  final UserModel? user;
  UserSession({required this.token, required this.userId, this.user});

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
