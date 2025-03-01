import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'.tr()),
      ),
      body: ListView(
        children: [
          _buildLanguageOption(
            context,
            title: 'English',
            subtitle: 'English'.tr(),
            languageCode: 'en',
            isSelected: context.locale.languageCode == 'en',
          ),
          _buildLanguageOption(
            context,
            title: 'Türkçe',
            subtitle: 'Turkish'.tr(),
            languageCode: 'tr',
            isSelected: context.locale.languageCode == 'tr',
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String languageCode,
    required bool isSelected,
  }) {
    return ListTile(
      onTap: () {
        context.setLocale(Locale(languageCode));
      },
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
