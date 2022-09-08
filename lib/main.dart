import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:watch_it_later/controllers/settings__controller/dark__mode_setting.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import 'package:watch_it_later/utils/AppTexts.dart';
import 'package:watch_it_later/view/get__started/get__started__page.dart';
import 'model/newItemNotificationModel.dart';
import 'utils/get_pages.dart';
import 'utils/themes.dart';
import 'view/main__page/main__page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init hive
  await Hive.initFlutter();

  // register model generated with hive generator to open in when the get username page is opened
  Hive.registerAdapter<NewItemNotifcationModel>(
      NewItemNotifcationModelAdapter());

  // opening notifications box
  Box newNotifications =
      await Hive.openBox<NewItemNotifcationModel>("newNotificationsBox");

  // open the locals box because we need it now
  Box localBox = await Hive.openBox("locals");

  // this should be uncommented while debugging, so every time the app opened it will clear the box, in production delete it so the app will only show the notifications that are saved in the box
  // await localBox.clear();
  // await newNotifications.clear();
  runApp(WatchItLaterApp());
}

class WatchItLaterApp extends StatelessWidget {
  WatchItLaterApp({Key? key}) : super(key: key);
  // Dependency injection
  final MainController mainController =
      Get.put(MainController(), permanent: true);
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        defaultTransition: Transition.native,
        getPages: getPages,
        debugShowCheckedModeBanner: false,
        title: AppTexts.mainTitle,
        theme: AppThemes(context: context).lightTheme,
        darkTheme: AppThemes(context: context).darkTheme,
        themeMode: themeController.getPreviousTheme(),
        home: mainController.getUserStatus()
            ? const GetStartedPage()
            : const MainPage(),
      ),
    );
  }
}
