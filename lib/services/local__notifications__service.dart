// ignore_for_file: unused_field, unused_local_variable

import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  // Getting instance of the notification plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

// Specifying the android settings details
  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    // Channel id
    'MYID',
    // Channel name
    'NOTIFICATION',
    // Channel description
    channelDescription: 'Description',
    // Notif. sound
    playSound: true,
    // Priority level
    priority: Priority.high,
    // Importance level
    importance: Importance.high,
  );

// Init method
  Future<void> init() async {
    // Declaring the android settings with icon
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/app_icon');

    // Declaring the ios permission settings
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      // settings to false, no request for now
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

// Request now
    await requestIOSpermission();

    // Now, init them
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      // I don't target macOs for now
      macOS: null,
    );

    // init this, when I will understand this, i'll explain hah
    tz.initializeTimeZones();

    // init the big one
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    //send test notification on app open
    await sendNot();
  }

  Future<void> requestIOSpermission() async {
    final bool? result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future sendNot() async {
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: _androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      Random().nextInt(9000),
//NOTIFICATION ID - SHOULD BE UNIQUE/RANDOM
      'Hello',
      'World!',
      platformChannelSpecifics,
    );
  }
}
