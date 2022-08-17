// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/controllers/settings__controller/dark__mode_setting.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import 'package:watch_it_later/utils/AppTexts.dart';
import 'package:watch_it_later/view/get__started/get__started__page.dart';
import 'package:watch_it_later/view/get__username__from__user/get__username__page.dart';
import 'package:watch_it_later/view/notification__full__page/notification__full__page.dart';
import 'model/newItemNotificationModel.dart';
import 'services/local__notifications__service.dart';
import 'utils/themes.dart';
import 'view/main__page/main__page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init hive
  await Hive.initFlutter();
  // register model generated with hive generator
  Hive.registerAdapter<NewItemNotifcationModel>(
      NewItemNotifcationModelAdapter());
  // opening the hive box
  Box newNotifications =
      await Hive.openBox<NewItemNotifcationModel>("newNotificationsBox");
  Box localBox = await Hive.openBox("locals");

  // this should be uncommented while debugging, so every time the app opened it will clear the box, in production delete it so the app will only show the notifications that are saved in the box
  await newNotifications.clear();

  // localBox.clear();

//

  NotificationService().init();




  runApp(WatchItLaterApp());


}

class WatchItLaterApp extends StatelessWidget {
  WatchItLaterApp({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
  final ThemeController themeController = Get.put(ThemeController());
  Box localBox = Hive.box("locals");

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.native,
      getPages: [
        GetPage(name: '/getUsernamePage', page: () => GetUsernamePage()),
        GetPage(name: ('/mainPage'), page: () => MainPage()),
        GetPage(
            name: '/notificationFullPage', page: () => NotificationFullPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: AppTexts.mainTitle,
      theme: AppThemes(context: context).lightTheme,
      darkTheme: AppThemes(context: context).darkTheme,
      themeMode: themeController.getPreviousTheme(),
      home: mainController.getUserStatus() ? GetStartedPage() : MainPage(),
    );
  }
}
