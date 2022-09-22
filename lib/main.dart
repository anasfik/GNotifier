import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:watch_it_later/bindings/initial_binding.dart';
import 'package:watch_it_later/controllers/settings__controller/dark__mode_setting.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import 'package:watch_it_later/services/user_status/new_user_detecter.dart';
import 'package:watch_it_later/utils/AppTexts.dart';
import 'package:watch_it_later/view/get__started/get__started__page.dart';
import 'services/main_init_methods/main_init_methods.dart';
import 'utils/get_pages.dart';
import 'utils/themes.dart';
import 'view/main__page/main__page.dart';

Future<void> main() async {
  await MainMethodsService().init();
  InitialBinding().dependencies();
  runApp(const WatchItLaterApp());
}

class WatchItLaterApp extends GetView<ThemeController> {
  const WatchItLaterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        title: AppTexts.mainTitle,
        theme: AppThemes(context: context).lightTheme,
        darkTheme: AppThemes(context: context).darkTheme,
        themeMode: controller.getPreviousTheme(),
        initialBinding: InitialBinding(),
        getPages: getPages,
        defaultTransition: Transition.fade,
        initialRoute: NewUserDetecter().isNewUsingApp()
            ? Paths.getStartedPath
            : Paths.mainPath,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
