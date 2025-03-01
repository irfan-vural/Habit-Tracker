import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/habit.dart';
import '../../data/repositories/habit_repository.dart';

part 'habit_list_cubit.freezed.dart';

@freezed
class HabitListState with _$HabitListState {
  const factory HabitListState({
    @Default([]) List<Habit> habits,
    @Default(false) bool isLoading,
    String? error,
  }) = _HabitListState;
}

class HabitListCubit extends Cubit<HabitListState> {
  final HabitRepository _repository;

  HabitListCubit({required HabitRepository repository})
      : _repository = repository,
        super(const HabitListState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _repository.initialize();
      final habits = await _repository.getHabits();
      emit(state.copyWith(
        habits: habits,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> loadHabits() async {
    emit(state.copyWith(isLoading: true));
    try {
      final habits = await _repository.getHabits();
      emit(state.copyWith(
        habits: habits,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> addHabit(Habit habit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _repository.addHabit(habit);
      final updatedHabits = [...state.habits, habit];
      emit(state.copyWith(
        habits: updatedHabits,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> updateHabit(Habit habit) async {
    try {
      await _repository.updateHabit(habit);
      final updatedHabits = state.habits.map((h) {
        if (h.id == habit.id) {
          return habit;
        }
        return h;
      }).toList();
      emit(state.copyWith(habits: updatedHabits));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> updateHabitProgress(String habitId) async {
    try {
      final habit = state.habits.firstWhere((h) => h.id == habitId);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      // Bugün için zaten tamamlanmış mı kontrol et
      final isAlreadyCompletedToday = habit.completedDates.any(
        (date) =>
            date.year == today.year &&
            date.month == today.month &&
            date.day == today.day,
      );

      if (!isAlreadyCompletedToday) {
        final updatedHabit = habit.copyWith(
          dailyProgress: habit.dailyProgress + 1,
          completedDates: [...habit.completedDates, today],
          updatedAt: DateTime.now(),
        );

        await _repository.updateHabit(updatedHabit);

        final updatedHabits = state.habits.map((h) {
          return h.id == habitId ? updatedHabit : h;
        }).toList();

        emit(state.copyWith(habits: updatedHabits));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> reorderHabits(int oldIndex, int newIndex) async {
    final habits = [...state.habits];
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final habit = habits.removeAt(oldIndex);
    habits.insert(newIndex, habit);

    final updatedHabits = habits.asMap().entries.map((entry) {
      return entry.value.copyWith(order: entry.key);
    }).toList();

    emit(state.copyWith(habits: updatedHabits));
    await _repository.updateHabitsOrder(updatedHabits);
  }

  Future<void> deleteHabit(String habitId) async {
    try {
      await _repository.deleteHabit(habitId);
      final updatedHabits = state.habits.where((h) => h.id != habitId).toList();
      emit(state.copyWith(habits: updatedHabits));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
