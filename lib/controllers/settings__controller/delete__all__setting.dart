import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../model/newItemNotificationModel.dart';
import '../../services/local__notifications__service.dart';
import '../helpers__controllers/dialogs__controller.dart';

class DeleteAllSetting extends GetxController {
  
  final DialogsController dialogsController = Get.put(DialogsController());
  Box newNotificationsBox =
      Hive.box<NewItemNotifcationModel>('newNotificationsBox');
  deleteAll() {
    newNotificationsBox.clear();
    NotificationService().cancelAllNotifications();

    
    // showing snackbar
    dialogsController.showSnackbar("done", "all notifications deleted successfully");
  }
}
