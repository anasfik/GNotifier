import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/controllers/helpers__controllers/extensions/show_snackbar.dart';

import '../helpers__controllers/dialogs__controller.dart';

class EnableOngoingSetting extends GetxController {
  final DialogsController dialogsController = Get.put(DialogsController());

  // bool
  static Box localBox = Hive.box("locals");

  bool isOngoingEnabled = localBox.get("isOngoingEnabled") ?? true;

  //toggle method
  setEnabledOngoing(boolValue) {
    isOngoingEnabled = boolValue;
    update();
    localBox.put("isOngoingEnabled", isOngoingEnabled);
    dialogsController
        .showSnackbar("those changes will be applied after app restart");
  }

  getEnabledOngoing() {
    return isOngoingEnabled;
  }
}
