import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/utils/AppTexts.dart';
import 'package:watch_it_later/view/get__started/get__started__page.dart';
import 'package:watch_it_later/view/get__username__from__user/getUsernamePage.dart';

import 'model/newItemNotificationModel.dart';
import 'view/main__page/main__page.dart';

void main() async {
  // init hive
  await Hive.initFlutter();
  // register model generated with hive generator
  Hive.registerAdapter<NewItemNotifcationModel>(
      NewItemNotifcationModelAdapter());
  // opening the hive box
  Box newNotifications =
      await Hive.openBox<NewItemNotifcationModel>("newNotificationsBox");

  // this should be uncommented while debugging, so everytime the app opened it will clear the box, in production delete it so the app will only show the notifications that are saved in the box
  newNotifications.clear();
  runApp(const WatchItLaterApp());
}

class WatchItLaterApp extends StatelessWidget {
  const WatchItLaterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.native,
      getPages: [
        GetPage(name: '/getUsernamePage', page: () => GetUsernamePage()),
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/', page: () => MainPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: AppTexts.mainTitle,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: AppColors.materialDarkBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetStartedPage(),
    );
  }
}
