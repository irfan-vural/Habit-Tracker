import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/habit.dart';
import '../../presentation/cubit/habit_list_cubit.dart';
import '../pages/edit_habit_page.dart';

class HabitDetailPage extends StatelessWidget {
  final String habitId;

  const HabitDetailPage({
    super.key,
    required this.habitId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitListCubit, HabitListState>(
      builder: (context, state) {
        final habit = state.habits.firstWhere((h) => h.id == habitId);

        return Scaffold(
          appBar: AppBar(
            title: Text(habit.name),
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) async {
                  switch (value) {
                    case 'edit':
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditHabitPage(habit: habit),
                        ),
                      );
                      break;
                    case 'archive':
                      final updatedHabit =
                          habit.copyWith(isArchived: !habit.isArchived);
                      await context
                          .read<HabitListCubit>()
                          .updateHabit(updatedHabit);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                      break;
                    case 'delete':
                      if (context.mounted) {
                        await _showDeleteConfirmation(context, habit);
                      }
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      title: Text(
                        'Edit'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'archive',
                    child: ListTile(
                      leading: Icon(
                        habit.isArchived ? Icons.unarchive : Icons.archive,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      title: Text(
                        habit.isArchived ? 'Unarchive'.tr() : 'Archive'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      title: Text(
                        'Delete'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                      ),
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildProgressHeader(context, habit),
                _buildStats(context, habit),
                _buildProgressCalendar(context, habit),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressHeader(BuildContext context, Habit habit) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: habit.color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  habit.icon,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            habit.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (habit.description != null) ...[
            const SizedBox(height: 8),
            Text(
              habit.description!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressCalendar(BuildContext context, Habit habit) {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final startingWeekday = firstDayOfMonth.weekday;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMMM yyyy').format(now),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: (daysInMonth + startingWeekday - 1),
            itemBuilder: (context, index) {
              if (index < startingWeekday - 1) {
                return const SizedBox();
              }
              final day = index - startingWeekday + 2;
              final date = DateTime(now.year, now.month, day);
              final isToday = date.day == now.day;

              // Kontrol et: Bu tarihte habit tamamlanmış mı?
              final isCompleted = habit.completedDates.any(
                (completedDate) =>
                    completedDate.year == date.year &&
                    completedDate.month == date.month &&
                    completedDate.day == date.day,
              );

              return Container(
                decoration: BoxDecoration(
                  color:
                      isCompleted ? habit.color : habit.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: isToday
                      ? Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        )
                      : null,
                ),
                child: Center(
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: isCompleted ? Colors.white : habit.color,
                      fontWeight: isToday ? FontWeight.bold : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteConfirmation(BuildContext context, Habit habit) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Habit'.tr()),
        content: Text('Are you sure you want to delete this habit?'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              context.read<HabitListCubit>().deleteHabit(habit.id);
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to previous screen
            },
            child: Text(
              'Delete'.tr(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context, Habit habit) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistics'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                context,
                'Current Streak'.tr(),
                '${habit.currentStreak} days',
                Icons.local_fire_department,
                Colors.orange,
              ),
              _buildStatItem(
                context,
                'Best Streak'.tr(),
                '${habit.bestStreak} days',
                Icons.emoji_events,
                Colors.amber,
              ),
              _buildStatItem(
                context,
                'Total'.tr(),
                habit.totalCompletions.toString(),
                Icons.check_circle,
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
