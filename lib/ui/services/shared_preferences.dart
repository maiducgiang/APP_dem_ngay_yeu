import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  setString(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value ?? "");
  }

  getString(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  setInt(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value ?? 0);
  }

  getInt(key) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getInt(key);
    return result ?? 0;
  }

  setBool(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value ?? false);
  }

  getBool(key) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(key);
    return result ?? false;
  }

  setDoubble(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value ?? 0.0);
  }

  getDouble(key) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getDouble(key);
    return result ?? 0.0;
  }

  remove(key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
