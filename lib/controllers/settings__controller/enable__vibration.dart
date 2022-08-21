import 'package:get/get.dart';
import 'package:hive/hive.dart';

class EnableVibrationSetting extends GetxController {
  // bool
  static Box localBox = Hive.box("locals");

  bool isVibrationEnabled = localBox.get("isVibrationEnabled") ?? true;

  //toggle method
  setEnabledVibration(boolValue) {
    isVibrationEnabled = boolValue;
    update();
    localBox.put("isVibrationEnabled", isVibrationEnabled);
  }

  getEnabledVibration() {
    return isVibrationEnabled;
  }
}
