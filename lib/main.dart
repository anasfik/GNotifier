// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/utils/AppTexts.dart';

import 'model/newItemNotificationModel.dart';
import 'view/main__page/main__page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<NewItemNotifcationModel>(
      NewItemNotifcationModelAdapter());

  Box newNotifications =
      await Hive.openBox<NewItemNotifcationModel>("newNotificationsBox");
  newNotifications.clear();
  runApp(WatchItLaterApp());
}

class WatchItLaterApp extends StatelessWidget {
  const WatchItLaterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTexts.mainTitle,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: AppColors.materialDarkBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
