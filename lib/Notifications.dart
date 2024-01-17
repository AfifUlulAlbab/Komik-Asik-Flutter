import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void showNotification(String title, String body) async {
    await popUpNotification(title, body);
  }

  Future<void> onBackgroundMessage(RemoteMessage message) async {
    debugPrint("${message.notification?.title}");
    debugPrint("${message.notification?.body}");
  }

  void onOpened(RemoteMessage message) async {
    final data = message.data;
    debugPrint("$data");
  }

  initializeNotification() async {
    final fcm = FirebaseMessaging.instance;

    try {
      if (Platform.isAndroid) {
        await fcm.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

        await fcm.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }

      var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettings =
      new InitializationSettings(android: initializationSettingsAndroid);
      flutterLocalNotificationsPlugin.initialize(initializationSettings);

      FirebaseMessaging.onMessage.listen(
            (RemoteMessage message) {
          showNotification("${message.notification?.title}",
              "${message.notification?.body}");
        },
      );
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(onOpened);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

Future<void> popUpNotification(String title, String body) async {
  var androidPlatform = AndroidNotificationDetails(
    'channel_ID',
    'channel name',
    importance: Importance.max,
    playSound: true,
    showProgress: true,
    priority: Priority.high,
    ticker: 'test ticker',
  );
  var platformChannelSpecifics = NotificationDetails(android: androidPlatform);
  await NotificationHandler()
      .flutterLocalNotificationsPlugin
      .show(0, title, body, platformChannelSpecifics, payload: 'test');
}

