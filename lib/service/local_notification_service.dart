import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService();

  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //**
  //  This Function For Initialize the Notification Setup
  // */
  Future<void> initialize() async {
    const androidInit =
        AndroidInitializationSettings('@drawable/ic_stat_warning');

    // const iosInitialize = IOSInitializationSettings();

    const initSettings = InitializationSettings(android: androidInit);

    _localNotificationsPlugin.initialize(initSettings);
  }

  //**
  //  id {int} The Id for the Current Notification
  //  title {string} the Title of Notification
  //  body {string} Notification Message
  // */
  Future<void> showNotification(id, title, body) async {
    const androidDetails = AndroidNotificationDetails(
        "channelId", "channelName",
        importance: Importance.high);

    // final iosDetails = IOSNotificationDetails();

    const generalNotification = NotificationDetails(android: androidDetails);

    await _localNotificationsPlugin.show(id, title, body, generalNotification);
  }
}
