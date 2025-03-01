import 'package:atomic_habit_tracker/features/habits/presentation/pages/icon_picker_page.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/habit.dart';
import '../cubit/habit_list_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:atomic_habit_tracker/core/services/notification_service.dart';

class NewHabitPage extends StatefulWidget {
  const NewHabitPage({super.key});

  @override
  State<NewHabitPage> createState() => _NewHabitPageState();
}

class _NewHabitPageState extends State<NewHabitPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  int _dailyCompletionGoal = 1;
  Color _selectedColor = Colors.orange;
  bool _enableNotifications = false;
  IconData _selectedIcon = FontAwesomeIcons.dumbbell;

  final List<Color> _colors = [
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.yellow,
    Colors.indigo,
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onNotificationToggled(bool value) async {
    if (value) {
      final hasPermission = await NotificationService.requestPermission();
      if (hasPermission) {
        setState(() => _enableNotifications = true);
      }
    } else {
      setState(() => _enableNotifications = false);
    }
  }

  void _saveHabit() {
    if (_nameController.text.isEmpty) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error'.tr(),
          message: 'Please enter habit name'.tr(), // message is optional

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      final habit = Habit(
        id: const Uuid().v4(),
        name: _nameController.text,
        description: _descriptionController.text,
        dailyCompletionGoal: _dailyCompletionGoal,
        color: _selectedColor,
        icon: _selectedIcon,
        enableNotifications: _enableNotifications,
        notificationTime: _enableNotifications ? DateTime.now() : null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (_enableNotifications) {
        NotificationService.scheduleHabitReminders(habit.id, habit.name);
      }

      context.read<HabitListCubit>().addHabit(habit);
      Navigator.pop(context);
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Nice'.tr(),
          message: 'New habit added'.tr(), // message is optional

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _saveHabit,
            child: Text(
              'Save'.tr(),
              style: TextStyle(
                color: _nameController.text.isEmpty
                    ? Colors.grey
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
        title: Text('New Habit'.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('HABIT'.tr()),
            _buildTextField(
              controller: _nameController,
              hintText: 'Name'.tr(),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _descriptionController,
              hintText: 'Description'.tr(),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('DAILY COMPLETION'.tr()),
            _buildCompletionCounter(),
            const SizedBox(height: 24),
            _buildSectionTitle('COLOR'.tr()),
            _buildColorPicker(),
            const SizedBox(height: 24),
            _buildSectionTitle('ICON'.tr()),
            _buildIconSelector(),
            const SizedBox(height: 24),
            _buildSectionTitle('REMINDER'.tr()),
            _buildNotificationToggle(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    void Function(String)? onChanged,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCompletionCounter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _dailyCompletionGoal.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _dailyCompletionGoal > 1
                      ? () => setState(() => _dailyCompletionGoal--)
                      : null,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _dailyCompletionGoal++),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _colors.map((color) {
          return GestureDetector(
            onTap: () => setState(() => _selectedColor = color),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedColor == color
                      ? Colors.white
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: _selectedColor == color
                  ? const Icon(Icons.check, color: Colors.white)
                  : null,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildIconSelector() {
    return GestureDetector(
      onTap: () async {
        final IconData? result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IconPickerPage(),
          ),
        );
        if (result != null) {
          setState(() {
            _selectedIcon = result;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            FaIcon(_selectedIcon),
            const SizedBox(width: 16),
            Text('Select'.tr()),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'.tr()),
            value: _enableNotifications,
            onChanged: _onNotificationToggled,
            contentPadding: EdgeInsets.zero,
          ),
          if (_enableNotifications) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Notifications will be sent every day at the time you choose.'
                    .tr(),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
