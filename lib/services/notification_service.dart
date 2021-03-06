import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  String _timezone = 'Unknown';
  List<String> _availableTimezones = <String>[];

  NotificationService() {
    _initData();
  }

  Future<void> _initData() async {
    try {
      _timezone = await FlutterNativeTimezone.getLocalTimezone();
    } catch (e) {
      print('Could not get the local timezone');
    }
    try {
      _availableTimezones = await FlutterNativeTimezone.getAvailableTimezones();
    } catch (e) {
      print('Could not get available timezones');
    }
  }

  Future<void> setNotification(int hour, int minute) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    var androidDetails = new AndroidNotificationDetails(
      "channelId",
      "channelName",
      "channelDescription",
      importance: Importance.max,
      priority: Priority.max,
    );
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);

    if (result) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.deleteNotificationChannelGroup('id');

      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Check your Challenge Progress!",
        "Did you do your challenge today? Go to check and grow your plant!",
        _setNotiTime(hour, minute),
        generalNotificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }

  Future<void> cancelAllNotification() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  tz.TZDateTime _setNotiTime(int hour, int minute) {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(_timezone));

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
