import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late final SharedPreferences prefs;

  /// Initialize SharedPreferences (call this in main.dart)
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUser({
    required String name,
    required String pass,
  }) async {
    await prefs.setString('name', name);
    await prefs.setString('pass', pass);
  }

  static Future<void> setLoginState({required bool isLogged}) async {
    await prefs.setBool('isLogged', isLogged);
  }

  static bool isLogged() {
    return prefs.getBool('isLogged') ?? false;
  }
}
