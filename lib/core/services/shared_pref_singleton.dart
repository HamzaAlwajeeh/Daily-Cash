import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences inistance;
  static Future<void> init() async {
    inistance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    inistance.setBool(key, value);
  }

  static getBool(String key) {
    return inistance.getBool(key) ?? false;
  }

  static setString(String key, String value) {
    inistance.setString(key, value);
  }

  static getString(String key) {
    return inistance.getString(key) ?? false;
  }
}
