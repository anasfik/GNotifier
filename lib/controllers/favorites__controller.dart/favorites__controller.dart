import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';
import '../../utils/AppColors.dart';
import '../helpersControllers/dialogsController.dart';

class FavoritesController extends GetxController
    with GetTickerProviderStateMixin {
  // dependencies injection
  DialogsController dialogsController = Get.put(DialogsController());

// favorite icon animation
  late AnimationController favIconController;
  late Animation scale;
  // initializing the fav. list always to get it from the box by filtering it with where method, in first start of the app it will be just empty list so there is no need to null check for it
  /// ignore_if_you_know_where_very_well: the where return is iterable, so toList() make it list

// add new item to favorites

  // add a notification card to favoritesItemsNotificationList
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

    // // I prefer putting ifs check like this cause it simple and everyone could understand it even me LOL
    // if (currentNotification.isFavorite!) {
    //   // when isFavorite true, add the NewItemNotifcationModel to the fav. list
    //   favoritesItemsNotificationList.add(currentNotification);

    //   // show success message
    //   dialogsController
    //       .showSuccess("${currentNotification.title} added to favorites");
    // }

    // // now the other side, if already it's favorite, so when executing it will be !isFavorite so
    // if (currentNotification.isFavorite == false) {
    //   // we remove it from the fav. list
    //   favoritesItemsNotificationList.remove(currentNotification);

    //   // show success message
    //   dialogsController.showSuccess(
    //       "${newNotificationsBox.getAt(passedIndex)!.title} removed from favorites");
    // }
  }

  animate(bool isChecked) {
    // card icon
    if (isChecked == true) {
      favIconController.forward();
    }
    if (isChecked == false) {
      favIconController.reverse();
    }
  }

  @override
  void onInit() {
    update();

    favIconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 40));

    scale = Tween(begin: 1.0, end: 1.2).animate(favIconController);
    favIconController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        favIconController.reverse();
      }
    });

    super.onInit();
  }

  // To-do: handle exceptions
}
