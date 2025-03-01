import 'package:atomic_habit_tracker/features/habits/presentation/pages/icon_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../domain/models/habit.dart';

typedef HabitFormState = _HabitFormState;

class HabitForm extends StatefulWidget {
  final Habit? initialHabit;
  final Function(Habit) onSubmit;

  const HabitForm({
    super.key,
    this.initialHabit,
    required this.onSubmit,
  });

  @override
  State<HabitForm> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late Color _selectedColor;
  late IconData _selectedIcon;
  late int _dailyGoal;
  late bool _enableNotifications;

  final List<Color> _colors = [
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.indigo,
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialHabit?.name);
    _descriptionController =
        TextEditingController(text: widget.initialHabit?.description);
    _selectedColor = widget.initialHabit?.color ?? Colors.blue;
    _selectedIcon = widget.initialHabit?.icon ?? Icons.check;
    _dailyGoal = widget.initialHabit?.dailyCompletionGoal ?? 1;
    _enableNotifications = widget.initialHabit?.enableNotifications ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'HABIT'.tr(),
            Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Habit name',
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Description (optional)',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'DAILY COMPLETION'.tr(),
            Row(
              children: [
                Text(
                  _dailyGoal.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (_dailyGoal > 1) {
                            setState(() => _dailyGoal--);
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() => _dailyGoal++);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'COLOR'.tr(),
            Wrap(
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
                      border: _selectedColor == color
                          ? Border.all(color: Colors.white, width: 2)
                          : null,
                    ),
                    child: _selectedColor == color
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'ICON'.tr(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _selectedColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(_selectedIcon, color: Colors.white),
              ),
              trailing: Text(
                'Select'.tr(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
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
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'REMINDER'.tr(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Enable Notifications'.tr()),
                  value: _enableNotifications,
                  onChanged: (value) {
                    setState(() => _enableNotifications = value);
                  },
                ),
                if (_enableNotifications) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Notifications will be sent every day at the time you choose.'
                        .tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ],
    );
  }

  Habit? save() {
    if (_formKey.currentState?.validate() ?? false) {
      return widget.initialHabit?.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        color: _selectedColor,
        icon: _selectedIcon,
        dailyCompletionGoal: _dailyGoal,
        enableNotifications: _enableNotifications,
        updatedAt: DateTime.now(),
      );
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
