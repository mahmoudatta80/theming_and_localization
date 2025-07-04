import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPreferences {
  static late SharedPreferences _preferences;

  AppSharedPreferences._();

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    }
  }

  static Future<dynamic> getData(String key) async {
    return _preferences.get(key);
  }

  static Future<void> removeData(String key) async {
    await _preferences.remove(key);
  }

  static Future<void> clear() async {
    await _preferences.clear();
  }
}
