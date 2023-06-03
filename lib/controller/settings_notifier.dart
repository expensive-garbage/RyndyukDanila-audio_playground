import 'package:flutter/material.dart';

import '../model/settings_preferences.dart';

class SettingsNotifier extends ChangeNotifier {
  late SettingsPreferences preferences;
  late bool isDark;

  SettingsNotifier() {
    isDark = false;
    preferences = SettingsPreferences();
    getPreferences();
  }

  setDarkTheme(bool value) {
    isDark = value;
    preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    isDark = await preferences.getTheme();
    notifyListeners();
  }
}
