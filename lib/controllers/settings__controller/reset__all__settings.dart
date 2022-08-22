import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/controllers/notifications__controllers/new__item__notification__error__controller.dart';

class ResetAllSettings extends GetxController {
  Box localBox = Hive.box('locals');
  reset() {
    dialogsController.showConfirmWithActions(
        "are you sure you want to reset all settings to default ?", "reset",
        () async {
      String? username = localBox.get("username");
      bool isNewUsingApp = localBox.get('isNewUsingApp');
      await localBox.clear();
      if (localBox.isEmpty) {
        dialogsController
            .showSnackbar("those changes will be applied after app restart");
        Get.back();
      }
      localBox.put("username", username);
      localBox.put("isNewUsingApp", isNewUsingApp);
    }, forDelete: true);
  }
}
