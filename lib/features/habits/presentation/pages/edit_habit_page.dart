import 'package:atomic_habit_tracker/features/habits/presentation/widgets/habit_form.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/habit.dart';
import '../cubit/habit_list_cubit.dart';

class EditHabitPage extends StatelessWidget {
  final Habit habit;

  const EditHabitPage({
    super.key,
    required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<HabitFormState>();

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
        title: Text('Edit Habit'.tr()),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final updatedHabit = formKey.currentState?.save();
              if (updatedHabit != null) {
                context.read<HabitListCubit>().updateHabit(updatedHabit);
                Navigator.pop(context);
              }
            },
            child: Text('Save'.tr()),
          ),
        ],
      ),
      body: HabitForm(
        key: formKey,
        initialHabit: habit,
        onSubmit: (updatedHabit) {
          context.read<HabitListCubit>().updateHabit(updatedHabit);
          Navigator.pop(context);
        },
      ),
    );
  }
}
