import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../model/newItemNotificationModel.dart';
import '../../services/local__notifications__service.dart';
import '../helpers__controllers/dialogs__controller.dart';

class DeleteAllSetting extends GetxController {
  
  final DialogsController dialogsController = Get.put(DialogsController());
  deleteAll() {
  Box newNotificationsBox =
      Hive.box<NewItemNotifcationModel>('newNotificationsBox');
    newNotificationsBox.clear();
    NotificationService().cancelAllNotifications();

    
    // showing snackbar
    dialogsController.showSnackbar("all notifications deleted successfully");
  }
}
