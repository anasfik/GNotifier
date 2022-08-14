// ignore_for_file: unused_field, unused_local_variable

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:watch_it_later/view/main__page/main__page.dart';

class NotificationService {
  // Getting instance of the notification plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Create the notification with the android settings
  NotificationDetails platformChannelSpecifics = const NotificationDetails(
    // you can add other platform but for now, I will use android
    android: _androidNotificationDetails,
  );

// Specifying the android settings details
  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    // Channel id
    'MYID',
    // Channel name
    'NOTIFICATION',
    // Channel description
    channelDescription: 'Description',
    // Notification sound
    playSound: true,
    // Priority level
    priority: Priority.high,
    // Importance level
    importance: Importance.high,
  );

// Init method
  Future<void> init() async {
    // Declaring the android settings with icon
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/app_icon');

    // Declaring the ios permission settings
   IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(

      // settings to false, no request for now
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,

      // settings to true, request for now
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      
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

    // Init this, when I will understand this, i'll explain hah
    tz.initializeTimeZones();

    // Init the big one
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    /// only for tests, in production comment or delete it
    //  Instant notification on app open
    await createInstantNotification(
      Random().nextInt(1000),
      'test title',
      'test description',
    );

    // schedule notification for the next 5 secondes
    createScheduledNotification(
      Random().nextInt(1000),
      'test title',
      'test description',
      // this will show it after 5 secondes from the current time
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 5),
      ),
    );
  }


  //
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

  //
  Future<void> createInstantNotification(
    int id,
    String? title,
    String? description,
  ) async {
    // Create the notification
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      description,
      // this is from the service class(this class)
      platformChannelSpecifics,
    );
  }

  Future<void> createScheduledNotification(
      int id, String? title, String? description, dynamic tzDateTime) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      description,
      tzDateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

//
void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  // Display a dialog with the notification details, tap ok to go to another page
  showDialog(
   context: Get.context as BuildContext,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title ?? "title error"),
      content: Text(body ?? "title error"),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
        )
      ],
    ),
  );
}
  

}
