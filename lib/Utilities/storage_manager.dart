

import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageManager{

  static Future<String?> getKey(String key) async {
    final pref = await SharedPreferences.getInstance();

    return pref.getString(key);
  }

  static Future<void> saveKey(String key, String value) async {
    final pref = await SharedPreferences.getInstance();

    pref.setString(key, value);
  }

  static Future<void> removeKey(String key) async {
    final pref = await SharedPreferences.getInstance();

    pref.remove(key);
  }

  static Future<void> clear() async {
    final pref = await SharedPreferences.getInstance();

    pref.clear();
  }
}