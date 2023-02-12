import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProvider {
  static late final SharedPreferences prefs;

  static initalize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setValue(String key, String value) async {
    return await prefs.setString(key, value);
  }

  static String getValue(key) {
    return prefs.getString(key) ?? '';
  }

  static Future<bool> clear() async {
    return await prefs.clear();
  }
}
