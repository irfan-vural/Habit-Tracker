import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubit/habit_list_cubit.dart';

class ReorderHabitsPage extends StatelessWidget {
  const ReorderHabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorder Habits'.tr()),
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocBuilder<HabitListCubit, HabitListState>(
        builder: (context, state) {
          if (state.habits.isEmpty) {
            return Center(
              child: Text('You have no habits'.tr()),
            );
          }

          return ReorderableListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.habits.length,
            onReorder: (oldIndex, newIndex) {
              context.read<HabitListCubit>().reorderHabits(oldIndex, newIndex);
            },
            itemBuilder: (context, index) {
              final habit = state.habits[index];
              return Card(
                key: ValueKey(habit.id),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: habit.color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: FaIcon(
                      habit.icon as IconData,
                      color: habit.color,
                      size: 20,
                    ),
                  ),
                  title: Text(habit.name),
                  trailing: const Icon(Icons.drag_handle),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
