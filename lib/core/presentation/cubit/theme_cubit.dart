import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../services/theme_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final themeMode = await ThemeService.getThemeMode();
    emit(themeMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await ThemeService.setThemeMode(mode);
    emit(mode);
  }
}
