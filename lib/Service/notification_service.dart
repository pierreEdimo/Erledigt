import 'package:erledigt/Model/task.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationService() => _notificationService;

  NotificationService._internal();

  Future<void> init() async {
    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: null,
      macOS: null,
    );

    tz.initializeTimeZones();

    await _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      print(
        "Notification payload" + payload.toString(),
      );
    }
  }

  void sheduleReminder(Task? task) async {
    int hour;
    int minute;

    task!.reminderHour == null
        ? hour = task.reminderTime!.hour
        : hour = int.parse(task.reminderHour!.split(":")[0]);

    task.reminderHour == null
        ? minute = task.reminderTime!.minute
        : minute = int.parse(task.reminderHour!.split(":")[1]);

    await _notificationsPlugin.zonedSchedule(
      task.hashCode,
      task.taskName,
      "time to finish ${task.taskName}",
      tz.TZDateTime.utc(
        task.reminderTime!.year,
        task.reminderTime!.month,
        task.reminderTime!.day,
        hour,
        minute,
      ).add(
        Duration(seconds: 10),
      ),
      const NotificationDetails(
          android: AndroidNotificationDetails(
        '123',
        'Erledigt',
        'task reminder',
      )),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: task.toString(),
    );
  }
}
