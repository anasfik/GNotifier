import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ShowOnLockScreenSetting extends GetxController {
  // bool
  static Box localBox = Hive.box("locals");

  bool isHiddenOnLockedScreen = localBox.get("isHiddenOnLockedScreen") ?? false;

  
  //toggle method
  setNotificationVisibilityOnLockScreen(boolValue) {
    isHiddenOnLockedScreen = boolValue;
    update();
    localBox.put("isHiddenOnLockedScreen", isHiddenOnLockedScreen);
  }

  getNotificationVisibilityOnLockScreen() {
    NotificationVisibility? notificationVisibility = isHiddenOnLockedScreen
        ? NotificationVisibility.secret
        : NotificationVisibility.public;

    return notificationVisibility;
  }
}
