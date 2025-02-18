import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferences {
  static const themePreferenceKey = 'Dark theme';

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themePreferenceKey, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themePreferenceKey) ?? false;
  }
}
