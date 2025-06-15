import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static const String _usersKey = 'registered_users';

  // Register user only if email not exists (case-insensitive)
  static Future<bool> registerUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_usersKey);
    Map<String, String> users =
        usersJson != null ? Map<String, String>.from(jsonDecode(usersJson)) : {};

    final key = email.trim().toLowerCase();
    if (users.containsKey(key)) {
      return false; // email already registered
    }

    users[key] = password;
    await prefs.setString(_usersKey, jsonEncode(users));
    return true;
  }

  // Validate user login credentials
  static Future<bool> validateUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_usersKey);
    if (usersJson != null) {
      final users = Map<String, String>.from(jsonDecode(usersJson));
      final key = email.trim().toLowerCase();
      return users.containsKey(key) && users[key] == password;
    }
    return false;
  }
}
