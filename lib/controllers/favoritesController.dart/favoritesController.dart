import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';

import '../helpersControllers/dialogsController.dart';

class FavoritesController extends GetxController {
  List<NewItemNotifcationModel> favoritesItemsNotificationList = [];

  void addToFavorites(int passedIndex) {
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");

    newNotificationsBox.getAt(passedIndex)!.isFavorite =
        !newNotificationsBox.getAt(passedIndex)!.isFavorite!;
    if (newNotificationsBox.getAt(passedIndex)!.isFavorite == true) {
      favoritesItemsNotificationList
          .add(newNotificationsBox.getAt(passedIndex)!);
    }
    if (newNotificationsBox.getAt(passedIndex)!.isFavorite == false) {
      favoritesItemsNotificationList
          .remove(newNotificationsBox.getAt(passedIndex)!);
    }
    Get.find<DialogsController>()
        .showSuccess("${newNotificationsBox.getAt(passedIndex)!.isFavorite}");
  }
}
