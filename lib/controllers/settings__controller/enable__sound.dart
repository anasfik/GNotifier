import 'package:get/get.dart';
import 'package:hive/hive.dart';

class EnableSoundSetting extends GetxController {
  // bool
  static Box localBox = Hive.box("locals");

  bool isSoundEnabled = localBox.get("isSoundEnabled") ?? true;

  //toggle method
  setEnabledSoundBool(boolValue) {
    isSoundEnabled = boolValue;
    update();
    localBox.put("isSoundEnabled", isSoundEnabled);
  }

  getEnabledSoundBool() {
    return isSoundEnabled;
  }
}
