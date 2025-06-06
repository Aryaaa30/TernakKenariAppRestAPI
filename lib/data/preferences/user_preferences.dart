import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ternak_kenari_app/data/model/response/user_model.dart';

class UserPreferences {
  static const _userKey = 'user_data';

  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static Future<UserModel> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      return UserModel.fromJson(jsonMap);
    } else {
      throw Exception('User tidak ditemukan');
    }
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
