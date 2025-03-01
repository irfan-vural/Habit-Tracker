import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../domain/models/habit.dart';
import 'package:atomic_habit_tracker/core/services/device_id_service.dart';
import 'package:atomic_habit_tracker/core/services/auth_service.dart';

class HabitRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();
  late final String _deviceId;

  Future<void> initialize() async {
    _deviceId = await DeviceIdService.getDeviceId();
    if (!_authService.isAuthenticated) {
      await _authService.signInAnonymously();
    }
  }

  Future<List<Habit>> getHabits() async {
    try {
      if (!_authService.isAuthenticated) {
        throw Exception('User not authenticated');
      }

      final snapshot = await _firestore
          .collection('users')
          .doc(_deviceId)
          .collection('habits')
          .get();

      print('Fetched habits count: ${snapshot.docs.length}');

      final habits = snapshot.docs
          .map((doc) {
            final data = Map<String, dynamic>.from(doc.data());

            // Sayısal değerlerin kontrolü
            void ensureNumericField(String field) {
              if (data[field] != null) {
                if (data[field] is String) {
                  data[field] = int.parse(data[field] as String);
                } else if (data[field] is double) {
                  data[field] = (data[field] as double).toInt();
                }
              }
            }

            // Sayısal alanların kontrolü
            ensureNumericField('dailyProgress');
            ensureNumericField('dailyCompletionGoal');
            ensureNumericField('currentStreak');
            ensureNumericField('bestStreak');
            ensureNumericField('totalCompletions');
            ensureNumericField('order');

            // Color değeri kontrolü
            if (data['color'] != null) {
              if (data['color'] is String) {
                data['color'] = int.parse(data['color'] as String);
              } else if (data['color'] is double) {
                data['color'] = (data['color'] as double).toInt();
              }
            }

            // Icon değeri kontrolü
            if (data['icon'] != null) {
              if (data['icon'] is int) {
                data['icon'] = data['icon'].toString();
              } else if (data['icon'] is double) {
                data['icon'] = data['icon'].toInt().toString();
              }
            } else {
              data['icon'] = Icons.help_outline.codePoint.toString();
            }

            // Boolean değerlerin kontrolü
            if (data['isDeleted'] is int) {
              data['isDeleted'] = (data['isDeleted'] as int) == 1;
            }
            if (data['isArchived'] is int) {
              data['isArchived'] = (data['isArchived'] as int) == 1;
            }
            if (data['enableNotifications'] is int) {
              data['enableNotifications'] =
                  (data['enableNotifications'] as int) == 1;
            }

            // Tarih dönüşümleri
            DateTime? parseTimestamp(dynamic value) {
              if (value is Timestamp) return value.toDate();
              if (value is String) return DateTime.parse(value);
              return null;
            }

            final createdAt = parseTimestamp(data['createdAt']);
            final updatedAt = parseTimestamp(data['updatedAt']);

            List<DateTime> completedDates = [];
            if (data['completedDates'] != null) {
              completedDates = (data['completedDates'] as List)
                  .map((date) => parseTimestamp(date))
                  .where((date) => date != null)
                  .map((date) => date!)
                  .toList();
            }

            // Debug için veri tiplerini kontrol et
            print('Processed data types:');
            data.forEach((key, value) {
              print('$key: ${value.runtimeType} = $value');
            });

            return Habit.fromJson({
              ...data,
              'id': doc.id,
              'createdAt': createdAt?.toIso8601String() ??
                  DateTime.now().toIso8601String(),
              'updatedAt': updatedAt?.toIso8601String() ??
                  DateTime.now().toIso8601String(),
              'completedDates':
                  completedDates.map((date) => date.toIso8601String()).toList(),
            });
          })
          .where((habit) => !habit.isDeleted)
          .toList();

      habits.sort((a, b) => a.order.compareTo(b.order));
      return habits;
    } catch (e) {
      print('Error fetching habits: $e');
      throw Exception('Failed to load habits: $e');
    }
  }

  Future<void> addHabit(Habit habit) async {
    try {
      if (!_authService.isAuthenticated) {
        throw Exception('User not authenticated');
      }

      await _firestore
          .collection('users')
          .doc(_deviceId)
          .collection('habits')
          .doc(habit.id)
          .set(habit.toJson());
    } catch (e) {
      throw Exception('Failed to add habit: $e');
    }
  }

  Future<void> updateHabit(Habit habit) async {
    try {
      await _firestore
          .collection('users')
          .doc(_deviceId)
          .collection('habits')
          .doc(habit.id)
          .update(habit.toJson());
    } catch (e) {
      throw Exception('Failed to update habit: $e');
    }
  }

  Future<void> deleteHabit(String habitId) async {
    try {
      await _firestore
          .collection('users')
          .doc(_deviceId)
          .collection('habits')
          .doc(habitId)
          .update({
        'isDeleted': true,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to delete habit: $e');
    }
  }

  Future<void> updateHabitsOrder(List<Habit> habits) async {
    final batch = _firestore.batch();

    for (var habit in habits) {
      final docRef = _firestore
          .collection('users')
          .doc(_deviceId)
          .collection('habits')
          .doc(habit.id);

      batch.update(docRef, {'order': habit.order});
    }

    try {
      await batch.commit();
    } catch (e) {
      throw Exception('Failed to update habits order: $e');
    }
  }
}
