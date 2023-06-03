import 'package:audio_playground/controller/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (context, SettingsNotifier settingsNotifier, child) {
        return Switch(
          value: settingsNotifier.isDark,
          onChanged: (bool value) {
            settingsNotifier.setDarkTheme(value);
          },
        );
      },
    );
  }
}
