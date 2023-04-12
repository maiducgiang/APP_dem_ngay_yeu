import 'package:mubaha/ui/services/shared_preferences.dart';

class AccountServices {
  final _box = SharedPreferencesService();
  final _tokenKey = "userToken";
  final _userIdKey = "userIdKey";
  final _accountType = "accountType";
  final _accountLangugae = "accountLanguage";
  final _isFirstLoad = "_firstLoad";

  Future<String> getUserToken() async => await _box.getString(_tokenKey) ?? "";
  Future<String> getUserId() async => await _box.getString(_userIdKey) ?? "";
  Future<String> getAccountType() async =>
      await _box.getString(_accountType) ?? "";
  Future<String> getAccountLanguage() async =>
      await _box.getString(_accountLangugae) ?? "";
  Future<bool> getIsFirstLoad() async =>
      await _box.getBool(_isFirstLoad) ?? false;

  saveUserToken(String token) => _box.setString(_tokenKey, token);
  saveUserId(String userId) => _box.setString(_userIdKey, userId);
  saveAccountType(String type) => _box.setString(_accountType, type);
  saveAccountLanguage(String type) => _box.setString(_accountLangugae, type);
  saveIsFirstLoad(bool status) => _box.setBool(_isFirstLoad, status);
}
