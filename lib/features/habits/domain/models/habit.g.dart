// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      dailyCompletionGoal: (json['dailyCompletionGoal'] as num).toInt(),
      dailyProgress: (json['dailyProgress'] as num?)?.toInt() ?? 0,
      color: _colorFromJson((json['color'] as num).toInt()),
      icon: _iconDataFromJson(json['icon']),
      enableNotifications: json['enableNotifications'] as bool,
      notificationTime: json['notificationTime'] == null
          ? null
          : DateTime.parse(json['notificationTime'] as String),
      isArchived: json['isArchived'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt() ?? 0,
      completedDates: (json['completedDates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      bestStreak: (json['bestStreak'] as num?)?.toInt() ?? 0,
      totalCompletions: (json['totalCompletions'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'dailyCompletionGoal': instance.dailyCompletionGoal,
      'dailyProgress': instance.dailyProgress,
      'color': _colorToJson(instance.color),
      'icon': _iconDataToJson(instance.icon),
      'enableNotifications': instance.enableNotifications,
      'notificationTime': instance.notificationTime?.toIso8601String(),
      'isArchived': instance.isArchived,
      'isDeleted': instance.isDeleted,
      'order': instance.order,
      'completedDates':
          instance.completedDates.map((e) => e.toIso8601String()).toList(),
      'currentStreak': instance.currentStreak,
      'bestStreak': instance.bestStreak,
      'totalCompletions': instance.totalCompletions,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
