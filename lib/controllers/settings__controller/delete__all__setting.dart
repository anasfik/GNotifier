import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../model/newItemNotificationModel.dart';
import '../../services/local__notifications__service.dart';

class DeleteAllSetting extends GetxController {
  Box newNotificationsBox =
      Hive.box<NewItemNotifcationModel>('newNotificationsBox');
  deleteAll() {
    newNotificationsBox.clear();
    NotificationService().cancelAllNotifications();
  }
}
