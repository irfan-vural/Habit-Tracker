import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    tz.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _notifications.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );
  }

  static Future<bool> requestPermission() async {
    final platform = _notifications.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (platform != null) {
      await platform.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    return true;
  }

  static Future<void> scheduleHabitReminders(
      String habitId, String title) async {
    final now = DateTime.now();
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59);
    final remainingHours = endOfDay.difference(now).inHours;

    if (remainingHours <= 0) return;

    final interval = remainingHours >= 9
        ? 3
        : remainingHours >= 3
            ? 1
            : remainingHours;

    final notificationCount = remainingHours >= 3 ? 3 : 1;

    for (var i = 0; i < notificationCount; i++) {
      final scheduledTime = now.add(Duration(hours: interval * (i + 1)));
      if (scheduledTime.isBefore(endOfDay)) {
        await _notifications.zonedSchedule(
          habitId.hashCode + i,
          title,
          'Günlük görevini tamamlamayı unutma',
          tz.TZDateTime.from(scheduledTime, tz.local),
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'habit_reminders',
              'Habit Reminders',
              importance: Importance.high,
              priority: Priority.high,
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
      }
    }
  }

  static Future<void> cancelHabitReminders(String habitId) async {
    for (var i = 0; i < 3; i++) {
      await _notifications.cancel(habitId.hashCode + i);
    }
  }
}
