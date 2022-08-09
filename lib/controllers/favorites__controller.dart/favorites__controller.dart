import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';

import '../helpersControllers/dialogsController.dart';

class FavoritesController extends GetxController {
  DialogsController dialogsController = Get.put(DialogsController());

  dynamic favoritesItemsNotificationList =
      Hive.box<NewItemNotifcationModel>("newNotificationsBox")
              .values
              .toList()
              .where((element) => element.isFavorite as bool)
              .toList() ??
          [];

  void addToFavorites(int passedIndex) {
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");

    newNotificationsBox.getAt(passedIndex)!.isFavorite =
        !newNotificationsBox.getAt(passedIndex)!.isFavorite!;

    newNotificationsBox.putAt(
        passedIndex, newNotificationsBox.getAt(passedIndex)!);

    if (newNotificationsBox.getAt(passedIndex)!.isFavorite == true) {
      favoritesItemsNotificationList
          .add(newNotificationsBox.getAt(passedIndex)!);

      dialogsController.showSuccess(
          "${newNotificationsBox.getAt(passedIndex)!.title} added to favorites");
    }
    if (newNotificationsBox.getAt(passedIndex)!.isFavorite == false) {
      favoritesItemsNotificationList
          .remove(newNotificationsBox.getAt(passedIndex)!);

      Get.find<DialogsController>().showSuccess(
          "${newNotificationsBox.getAt(passedIndex)!.title} removed from favorites");
    }
    update();
  }

  @override
  void onReady() {
    print(Hive.box<NewItemNotifcationModel>("newNotificationsBox")
        .values
        .toList()
        .where((element) => element.isFavorite as bool)
        .toList());
    super.onReady();
  }
}
