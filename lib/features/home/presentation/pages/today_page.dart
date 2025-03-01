import 'package:atomic_habit_tracker/core/widgets/logo_widget.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/pages/habit_detail_page.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/widgets/habit_context_menu.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/cubit/habit_list_cubit.dart';
import 'package:atomic_habit_tracker/features/habits/domain/models/habit.dart';
import 'package:atomic_habit_tracker/core/widgets/shimmer_loading.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodayView();
  }
}

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Today'.tr()),
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocBuilder<HabitListCubit, HabitListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoadingState();
          }

          if (state.habits.isEmpty) {
            return _buildEmptyState(context);
          }

          return _buildHabitList(context, state.habits);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/home/new-habit'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LogoWidget(size: 90),
          const SizedBox(height: 16),
          Text(
            'You have no habits'.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.push('/home/new-habit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Add New'.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ShimmerLoading(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ShimmerLoading(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                )),
      ],
    );
  }

  Widget _buildHabitList(BuildContext context, List<Habit> habits) {
    final activeHabits = habits.where((h) => !h.isArchived).toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    final totalCompleted = activeHabits
        .where((h) => h.dailyProgress >= h.dailyCompletionGoal)
        .length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSummaryCard(context, totalCompleted, activeHabits.length),
        const SizedBox(height: 16),
        ...activeHabits.map((habit) => _buildHabitCard(context, habit)),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context, int completed, int total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const LogoWidget(size: 48),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Great day to start tasks!'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Let\'s begin!'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  '$completed of $total completed'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitCard(BuildContext context, Habit habit) {
    final isCompleted = habit.dailyProgress >= habit.dailyCompletionGoal;

    return GestureDetector(
      onLongPress: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;

        showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (context) => HabitContextMenu(
            habit: habit,
            onDismiss: () => Navigator.pop(context),
            position: position,
            size: size,
          ),
        );
      },
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HabitDetailPage(
            habitId: habit.id,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: habit.color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      habit.icon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (habit.description != null)
                      Text(
                        habit.description!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: isCompleted
                    ? null
                    : () {
                        final today = DateTime.now();

                        // Günlük ilerlemeyi artır
                        if (habit.dailyProgress < habit.dailyCompletionGoal) {
                          final newProgress = habit.dailyProgress + 1;
                          final updatedHabit = habit.copyWith(
                            dailyProgress: newProgress,
                            // Sadece hedef tamamlandığında completed dates'e ekle
                            completedDates:
                                newProgress >= habit.dailyCompletionGoal
                                    ? [...habit.completedDates, today]
                                    : habit.completedDates,
                          );
                          context
                              .read<HabitListCubit>()
                              .updateHabit(updatedHabit);
                        } else {
                          // Hedef tamamlanmışsa sıfırla
                          final updatedHabit = habit.copyWith(
                            dailyProgress: 0,
                            completedDates: habit.completedDates
                                .where((date) =>
                                    date.year != today.year ||
                                    date.month != today.month ||
                                    date.day != today.day)
                                .toList(),
                          );
                          context
                              .read<HabitListCubit>()
                              .updateHabit(updatedHabit);
                        }
                      },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: habit.color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          color: habit.color,
                        )
                      : Text(
                          '${habit.dailyProgress}/${habit.dailyCompletionGoal}',
                          style: TextStyle(
                            color: habit.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HabitTile extends StatefulWidget {
  final Habit habit;
  final VoidCallback onDeleted;

  const _HabitTile({
    required this.habit,
    required this.onDeleted,
  });

  @override
  State<_HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<_HabitTile> {
  void _onTap() {
    final habit = widget.habit;
    final today = DateTime.now();

    // Günlük ilerlemeyi artır
    if (habit.dailyProgress < habit.dailyCompletionGoal) {
      final newProgress = habit.dailyProgress + 1;
      final updatedHabit = habit.copyWith(
        dailyProgress: newProgress,
        // Sadece hedef tamamlandığında completed dates'e ekle
        completedDates: newProgress >= habit.dailyCompletionGoal
            ? [...habit.completedDates, today]
            : habit.completedDates,
      );
      context.read<HabitListCubit>().updateHabit(updatedHabit);
    } else {
      // Hedef tamamlanmışsa sıfırla
      final updatedHabit = habit.copyWith(
        dailyProgress: 0,
        completedDates: habit.completedDates
            .where((date) =>
                date.year != today.year ||
                date.month != today.month ||
                date.day != today.day)
            .toList(),
      );
      context.read<HabitListCubit>().updateHabit(updatedHabit);
    }
  }

  void _showContextMenu(TapUpDetails details) {
    final habit = widget.habit;
    showHabitContextMenu(
      context: context,
      habit: habit,
      position: details.globalPosition,
      onDeleted: widget.onDeleted,
    );
  }

  @override
  Widget build(BuildContext context) {
    final habit = widget.habit;
    final isCompleted = habit.dailyProgress >= habit.dailyCompletionGoal;

    return Dismissible(
      key: Key(habit.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => widget.onDeleted(),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: InkWell(
          onTap: _onTap,
          onTapUp: _showContextMenu,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const LogoWidget(size: 48),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        habit.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (habit.description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          habit.description!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isCompleted
                          ? habit.color
                          : habit.color.withOpacity(0.5),
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          color: habit.color,
                        )
                      : Text(
                          '${habit.dailyProgress}/${habit.dailyCompletionGoal}',
                          style: TextStyle(
                            color: habit.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
