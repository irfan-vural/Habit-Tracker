import 'package:atomic_habit_tracker/features/habits/domain/models/habit.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/cubit/habit_list_cubit.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/widgets/habit_form.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditHabitPage extends StatelessWidget {
  final Habit habit;

  const EditHabitPage({
    super.key,
    required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Edit Habit'.tr()),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // HabitForm'dan güncellenmiş habit'i alacağız
              final updatedHabit = Form.of(context).save() as Habit;
              context.read<HabitListCubit>().updateHabit(updatedHabit);
              Navigator.pop(context);
            },
            child: Text('Save'.tr()),
          ),
        ],
      ),
      body: HabitForm(
        initialHabit: habit,
        onSubmit: (updatedHabit) {
          context.read<HabitListCubit>().updateHabit(updatedHabit);
          Navigator.pop(context);
        },
      ),
    );
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/edit-habit':
        return MaterialPageRoute(
          builder: (context) => EditHabitPage(
            habit: settings.arguments as Habit,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
