import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String name,
    String? description,
    required int dailyCompletionGoal,
    @Default(0) int dailyProgress,
    @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
    required Color color,
    @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
    required IconData icon,
    required bool enableNotifications,
    DateTime? notificationTime,
    @Default(false) bool isArchived,
    @Default(false) bool isDeleted,
    @Default(0) int order,
    @Default([]) List<DateTime> completedDates,
    @Default(0) int currentStreak,
    @Default(0) int bestStreak,
    @Default(0) int totalCompletions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}

Color _colorFromJson(int value) => Color(value);
int _colorToJson(Color color) => color.value;

IconData _iconDataFromJson(dynamic value) {
  try {
    // Null veya geçersiz değer kontrolü
    if (value == null) {
      return Icons.help_outline;
    }

    // FontAwesome ikonları için
    if (value is String) {
      if (value.startsWith('fa:')) {
        final iconCode = int.parse(value.split(':')[1]);
        return IconData(iconCode,
            fontFamily: 'FontAwesomeSolid',
            fontPackage: 'font_awesome_flutter');
      }
      // String olarak gelen sayısal değer için
      return IconData(int.parse(value), fontFamily: 'MaterialIcons');
    }
    // Direkt sayısal değer için
    if (value is num) {
      return IconData(value.toInt(), fontFamily: 'MaterialIcons');
    }
    // Diğer durumlar için varsayılan ikon
    return Icons.help_outline;
  } catch (e) {
    print('Icon parsing error: $e for value: $value');
    return Icons.help_outline;
  }
}

String _iconDataToJson(IconData icon) {
  try {
    if (icon.fontFamily == 'FontAwesomeSolid') {
      return 'fa:${icon.codePoint}';
    }
    return icon.codePoint.toString();
  } catch (e) {
    print('Icon serialization error: $e');
    return Icons.help_outline.codePoint.toString();
  }
}
