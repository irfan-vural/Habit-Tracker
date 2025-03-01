import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:atomic_habit_tracker/core/presentation/cubit/theme_cubit.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'.tr()),
      ),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, currentTheme) {
          return ListView(
            children: [
              _buildThemeOption(
                context,
                title: 'System'.tr(),
                subtitle: 'Use system theme'.tr(),
                icon: Icons.brightness_auto,
                isSelected: currentTheme == ThemeMode.system,
                onTap: () =>
                    context.read<ThemeCubit>().setThemeMode(ThemeMode.system),
              ),
              _buildThemeOption(
                context,
                title: 'Light'.tr(),
                subtitle: 'Light theme'.tr(),
                icon: Icons.light_mode,
                isSelected: currentTheme == ThemeMode.light,
                onTap: () =>
                    context.read<ThemeCubit>().setThemeMode(ThemeMode.light),
              ),
              _buildThemeOption(
                context,
                title: 'Dark'.tr(),
                subtitle: 'Dark theme'.tr(),
                icon: Icons.dark_mode,
                isSelected: currentTheme == ThemeMode.dark,
                onTap: () =>
                    context.read<ThemeCubit>().setThemeMode(ThemeMode.dark),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
    );
  }
}
