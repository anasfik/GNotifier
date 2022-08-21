import 'package:get/get.dart';

import 'dialogs__controller.dart';

class OnNotificationClick extends GetxController {
  OnNotificationClick({this.payload});
  final DialogsController dialogsController = Get.put(DialogsController());
  String? payload;

  @override
  void onReady() {
    if (payload != null) {
      dialogsController.showInfo("deleted",
          "the mission of this notification is completed, so it's automatically deleted .");
    }
    super.onReady();
  }
}
