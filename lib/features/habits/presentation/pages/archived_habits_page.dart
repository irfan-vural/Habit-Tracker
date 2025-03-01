import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/habit_list_cubit.dart';
import 'habit_detail_page.dart';

class ArchivedHabitsPage extends StatelessWidget {
  const ArchivedHabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archived Habits'.tr()),
      ),
      body: BlocBuilder<HabitListCubit, HabitListState>(
        builder: (context, state) {
          final archivedHabits = state.habits
              .where((h) => h.isArchived)
              .toList()
            ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

          if (archivedHabits.isEmpty) {
            return Center(
              child: Text('No archived habits'.tr()),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: archivedHabits.length,
            itemBuilder: (context, index) {
              final habit = archivedHabits[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: habit.color,
                    child: Icon(habit.icon, color: Colors.white),
                  ),
                  title: Text(habit.name),
                  subtitle: Text(habit.description ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.unarchive),
                    onPressed: () {
                      final updatedHabit = habit.copyWith(isArchived: false);
                      context.read<HabitListCubit>().updateHabit(updatedHabit);
                    },
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HabitDetailPage(habitId: habit.id),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
