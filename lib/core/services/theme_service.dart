import 'package:flutter/material.dart' show ThemeMode;
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _themeKey = 'theme_mode';
  static final _prefs = SharedPreferences.getInstance();

  static Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await _prefs;
    await prefs.setString(_themeKey, mode.name);
  }

  static Future<ThemeMode> getThemeMode() async {
    final prefs = await _prefs;
    final themeName = prefs.getString(_themeKey);
    return themeName != null
        ? ThemeMode.values.firstWhere((e) => e.name == themeName)
        : ThemeMode.system;
  }
}
