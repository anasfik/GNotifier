import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  bool isDarkMode = Hive.box('locals').get("isDarkMode") ?? false;

  // get it from box
  ThemeMode getPreviousTheme() {
    if (isDarkMode) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    // Set new bool to box
    Hive.box('locals').put("isDarkMode", isDarkMode);
    update();
  }
}
