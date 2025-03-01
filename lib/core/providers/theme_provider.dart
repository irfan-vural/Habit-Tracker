import 'package:flutter/material.dart';
import 'package:atomic_habit_tracker/core/services/theme_service.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    _themeMode = await ThemeService.getThemeMode();
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await ThemeService.setThemeMode(mode);
    notifyListeners();
  }
}
