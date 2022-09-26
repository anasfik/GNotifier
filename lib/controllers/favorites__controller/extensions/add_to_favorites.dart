import 'package:hive/hive.dart';
import 'package:watch_it_later/controllers/favorites__controller/favorites__controller.dart';
import 'package:watch_it_later/controllers/helpers__controllers/extensions/show_snackbar.dart';

import '../../../model/newItemNotificationModel.dart';

extension AddToExtension on FavoritesController {
  /// Add a notification card to favoritesItemsNotificationList box
  void addToFavorites(int passedIndex) {
    // notice the re-init of box
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");

    // for better understanding see this as, currentNotification that it change with the passedIndex from widget
    NewItemNotifcationModel? currentNotification =
        newNotificationsBox.getAt(passedIndex);

    // toggle the isFavorite bool (this change it in the context of the app only)
    currentNotification!.isFavorite = !currentNotification.isFavorite!;

    // after the toggle we need to put it in the context of the box so it change in the db also so if we kill the app it still in the box
    // putAt method is like it update the box NewItemNotifcationModel
    newNotificationsBox.putAt(passedIndex, currentNotification);

    if (currentNotification.isFavorite!) {
      dialogsController.showSnackbar("added to favorites");
    }
  }

  // To-do: handle exceptions
}
