import 'package:project_beta/constants/shared_preference_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLocalStorage {
  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setAccessToken(value) async {
    await _preferences.setString(SharedPreferenceConst.ACCESS_TOKEN, value);
  }

  static Future<String?> getAccessToken() async {
    return await _preferences.getString(SharedPreferenceConst.ACCESS_TOKEN);
  }

  static Future<void> setRefreshToken(value) async {
    await _preferences.setString(SharedPreferenceConst.REFRESH_TOKEN, value);
  }

  static Future<String?> getRefreshToken() async {
    return await _preferences.getString(SharedPreferenceConst.REFRESH_TOKEN);
  }

  static Future<void> setAccessTokenType(value) async {
    await _preferences.setString(SharedPreferenceConst.TOKEN_TYPE, value);
  }

  static Future<String?> getAccessTokenType() async {
    return await _preferences.getString(SharedPreferenceConst.TOKEN_TYPE);
  }
}
