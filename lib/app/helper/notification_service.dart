import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  Future init() async {
    await requestNotificationPermissions();

    tz.initializeTimeZones();

    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
            playSound: true,
            importance: NotificationImportance.High,
            criticalAlerts: true,
            enableLights: true,
            enableVibration: true,
            defaultRingtoneType: DefaultRingtoneType.Notification,
            defaultPrivacy: NotificationPrivacy.Public,
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);
  }

  Future<void> requestNotificationPermissions() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  Future<void> scheduleDailyNotification() async {
    DateTime now = DateTime.now();
    now.add(const Duration(minutes: 1));
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel',
        title: 'Record Daily Expenses',
        body: 'Don\'t forget to record your daily expenses!',
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationCalendar(
        hour: 20, // 8 PM
        minute: 0,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }

  // Future<void> testNotification() async {
  //   AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: 1,
  //       channelKey: 'basic_channel',
  //       title: 'Record Weekly expenses',
  //       body: 'Don\'t forget to record your weekly expenses!',
  //       notificationLayout: NotificationLayout.Default,
  //     ),
  //   );
  // }
}
