import 'package:atomic_habit_tracker/features/settings/presentation/pages/language_settings_page.dart';
import 'package:atomic_habit_tracker/features/settings/presentation/pages/theme_settings_page.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/pages/reorder_habits_page.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/pages/archived_habits_page.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Settings'.tr()),
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          _buildPremiumSection(context),
          _buildGeneralSettings(context),
          _buildSupportSection(context),
        ],
      ),
    );
  }

  Widget _buildPremiumSection(BuildContext context) {
    return ListTile(
      onTap: () {
        final snackBar = SnackBar(
          /// need to set following
          ///  properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Error'.tr(),
            message: 'Neary there'.tr(), // message is optional

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.warning,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      },
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.star, color: Colors.orange),
      ),
      title: Text('Unlock Premium'.tr()),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  Widget _buildGeneralSettings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'GENERAL SETTINGS'.tr(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.palette_outlined, color: Colors.purple),
          title: Text('Theme'.tr()),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ThemeSettingsPage(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.language, color: Colors.blue),
          title: Text('Language'.tr()),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LanguageSettingsPage(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.archive_outlined, color: Colors.red),
          title: Text('Archived Habits'.tr()),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArchivedHabitsPage(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.reorder, color: Colors.green),
          title: Text('Reorder Habits'.tr()),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReorderHabitsPage(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'SUPPORT'.tr(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
        ListTile(
          onTap: () {
            final snackBar = SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Error'.tr(),
                message: 'Neary there'.tr(), // message is optional

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.warning,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
          leading: const Icon(Icons.restore, color: Colors.teal),
          title: Text('Restore Purchases'.tr()),
        ),
        ListTile(
          leading: const Icon(Icons.share, color: Colors.blue),
          title: Text('Share App'.tr()),
        ),
        ListTile(
          leading: const Icon(Icons.star, color: Colors.orange),
          title: Text('Rate us on AppStore'.tr()),
          trailing: const Icon(Icons.open_in_new, size: 16),
        ),
        ListTile(
          leading: const Icon(Icons.privacy_tip_outlined, color: Colors.purple),
          title: Text('Privacy Policy'.tr()),
          trailing: const Icon(Icons.open_in_new, size: 16),
        ),
        ListTile(
          leading: const Icon(Icons.description_outlined, color: Colors.green),
          title: Text('Terms of Use'.tr()),
          trailing: const Icon(Icons.open_in_new, size: 16),
        ),
      ],
    );
  }
}
