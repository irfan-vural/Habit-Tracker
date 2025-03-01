import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class IconPickerPage extends StatelessWidget {
  const IconPickerPage({super.key});

  static const List<Map<String, IconData>> icons = [
    // Fitness & Health
    {'workout': FontAwesomeIcons.dumbbell},
    {'running': FontAwesomeIcons.personRunning},
    {'meditation': FontAwesomeIcons.spa},
    {'water': FontAwesomeIcons.glassWater},
    {'sleep': FontAwesomeIcons.bed},
    {'yoga': FontAwesomeIcons.child},

    // Education & Work
    {'study': FontAwesomeIcons.book},
    {'code': FontAwesomeIcons.code},
    {'write': FontAwesomeIcons.pen},
    {'read': FontAwesomeIcons.bookOpen},
    {'work': FontAwesomeIcons.briefcase},
    {'learn': FontAwesomeIcons.graduationCap},

    // Lifestyle
    {'music': FontAwesomeIcons.music},
    {'art': FontAwesomeIcons.paintbrush},
    {'cook': FontAwesomeIcons.utensils},
    {'clean': FontAwesomeIcons.broom},
    {'garden': FontAwesomeIcons.leaf},
    {'finance': FontAwesomeIcons.wallet},

    // Social & Personal
    {'family': FontAwesomeIcons.peopleGroup},
    {'call': FontAwesomeIcons.phone},
    {'journal': FontAwesomeIcons.book},
    {'meditate': FontAwesomeIcons.om},
    {'pray': FontAwesomeIcons.handsPraying},
    {'gratitude': FontAwesomeIcons.heart},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Icon'.tr()),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: icons.length,
        itemBuilder: (context, index) {
          final iconData = icons[index].values.first;
          final iconName = icons[index].keys.first;

          return _buildIconItem(
            context,
            iconData: iconData,
            name: iconName,
            onTap: () => Navigator.pop(context, iconData),
          );
        },
      ),
    );
  }

  Widget _buildIconItem(
    BuildContext context, {
    required IconData iconData,
    required String name,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              iconData,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              name.tr(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
