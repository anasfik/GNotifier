import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class EnableOngoingSetting extends GetxController {
  // bool
  static Box localBox = Hive.box("locals");

  bool isOngoingEnabled = localBox.get("isOngoingEnabled") ?? true;

  //toggle method
  setEnabledOngoing(boolValue) {
    isOngoingEnabled = boolValue;
    update();
    localBox.put("isOngoingEnabled", isOngoingEnabled);
  }

  getEnabledOngoing() {
    return isOngoingEnabled;
  }
}
