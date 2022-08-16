import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:watch_it_later/utils/themes.dart';

class ThemeController extends GetxController {
  bool isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    print("$isDarkMode ${Get.context}");
    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    update();
  }
}
