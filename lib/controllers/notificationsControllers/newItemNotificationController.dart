// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/general__widgets/action__button.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/general__widgets/text__field.dart';
import 'package:watch_it_later/view/notification__full__page/widgets/bottom__sheet_widget.dart';
import '../../model/newItemNotificationModel.dart';
import '../favorites__controller.dart/favorites__controller.dart';
import '../helpersControllers/dialogsController.dart';
import '../mainController.dart';

class NewNotificationController extends GetxController {
  // Dependency injection
  final DialogsController dialogsController = Get.put(DialogsController());
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  final MainController mainController = Get.put(MainController());

  /// textEditingControllers

  // New item  Text editing controllers
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  // textFields keys
  final titleTextFieldKey = UniqueKey();
  final descriptionTextFieldKey = UniqueKey();

  // Options variables
  bool isRepeatedOptionEnabled = true;
  bool isAlarmOptionEnabled = false;

  // Title variables
  int titleMaxLength = 10;
  int titleWrittenLength = 0;
  double titleCountBoxScale = 0;

  // Description variables
  int descriptionMaxLength = 40;
  int descriptionWrittenLength = 0;
  double descriptionCountBoxScale = 0;


// variables that will take the new data to update the notification
String? newTitle;
  String? newDescription;
  bool? newIsAlarmed;
  bool? newIsRepeated;
  DateTime? newDate;
 
  // Add new item
  addNewNotification(
    String title,
    String description,
    DateTime date,
    bool isRepeated,
    bool isAlarm,
  ) {
    // init the hive box
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");
    // and add it to box
    newNotificationsBox.add(
      NewItemNotifcationModel(
        title,
        description,
        date,
        isRepeated,
        isAlarm,

        // isFavorite: false by default :
        false,
      ),
    );
// using openContainer from the ainmations package trait the AddNewNotificationPage as just a widget so open/close it doesn't affect the text editing controllers so we should re-init them after any add operations

    titleController.text = "";
    descriptionController.text = "";
    Get.back();
  }

// delete notification
  deleteNotification(int index) {
    // init the hive box
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");

    favoritesController.favoritesItemsNotificationList.removeWhere((element) =>
        element.title == newNotificationsBox.getAt(index)!.title &&
        element.description == newNotificationsBox.getAt(index)!.description &&
        element.dateToShow == newNotificationsBox.getAt(index)!.dateToShow &&
        element.isRepeated == newNotificationsBox.getAt(index)!.isRepeated &&
        element.isAlarmed == newNotificationsBox.getAt(index)!.isAlarmed &&
        element.isFavorite == newNotificationsBox.getAt(index)!.isFavorite);

// and delete it from box
    newNotificationsBox.deleteAt(index);
    update();
    Get.back();
  }
  
  setNewTitle(String value) {
    newTitle = value;
    titleController.text = newTitle!;
    update();
    Get.back();
  }

// set / change the description without update it in box
  setNewDescription(String value) {
    newDescription = value;
    descriptionController.text = newDescription!;
    update();
    Get.back();
  }

  // this shows the bottom sheet for update title
  showEditDialog(String hint, NewItemNotifcationModel gettedNotification,
      int reversedIndex) {
    titleController.text = newTitle ?? gettedNotification.title;
    countTitleLength(titleController.text);
    update();
    Get.bottomSheet(
      BottomSheetWidget(
        onSuccess: () {
          setNewTitle(titleController.text);
        },
        forTitle: true,
        hint: hint,
        gettedNotification: gettedNotification,
      ),
    );
  }

// this shows the bottom sheet for update description

  showEditDescriptionDialog(
    String hint,
    NewItemNotifcationModel gettedNotification,
  ) {
    descriptionController.text =
        newDescription ?? gettedNotification.description;
    countTitleLength(descriptionController.text);

    update();
    Get.bottomSheet(BottomSheetWidget(
      onSuccess: () {
        setNewDescription(descriptionController.text);
      },
      forDescription: true,
      hint: hint,
      gettedNotification: gettedNotification,
    ));
  }

// edit notification
  updateNotification(int index, String title, String description, DateTime date,
      bool isRepeated, bool isAlarm, bool isFavorite) {
    // init the hive box
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");
    // and update it in box
    newNotificationsBox.putAt(
      index,
      NewItemNotifcationModel(
        title,
        description,
        date,
        isRepeated,
        isAlarm,
        isFavorite,
      ),
    );

    // edit it in favorites
    if (favoritesController.favoritesItemsNotificationList
        .contains(newNotificationsBox.getAt(index)!)) {
      favoritesController.favoritesItemsNotificationList
          .elementAt(index)
          .title = title;

      favoritesController.favoritesItemsNotificationList
          .elementAt(index)
          .description = description;
      favoritesController.favoritesItemsNotificationList
          .elementAt(index)
          .dateToShow = date;
      favoritesController.favoritesItemsNotificationList
          .elementAt(index)
          .isRepeated = isRepeated;
      favoritesController.favoritesItemsNotificationList
          .elementAt(index)
          .isAlarmed = isAlarm;
      favoritesController.favoritesItemsNotificationList
          .elementAt(index)
          .isFavorite = isFavorite;
    }

    Get.back();
  }

  // method handler for title text field
  countTitleLength(String title) async {
    if (title.isEmpty) {
      titleWrittenLength = 0;
      titleCountBoxScale = 0;
    } else {
      titleWrittenLength = title.length;
      titleCountBoxScale = 1;
    }
    update();
    if (title.length == titleMaxLength) {
      titleCountBoxScale = 1.5;
      await Future.delayed(const Duration(milliseconds: 30));
      titleCountBoxScale = 1;
    }

    update();
  }

//
  // method handler for description text field
  countDescriptionLength(String description) async {
    if (description.isEmpty) {
      descriptionWrittenLength = 0;
      descriptionCountBoxScale = 0;
    } else {
      descriptionWrittenLength = description.length;
      descriptionCountBoxScale = 1;
    }
    update();
    if (description.length == descriptionMaxLength) {
      descriptionCountBoxScale = 1.5;
      await Future.delayed(const Duration(milliseconds: 30));
      descriptionCountBoxScale = 1;
    }

    update();
  }

  // toggle isRepeatedOptionEnabled
  toggleRepeatedOptionBoolean() {
    isRepeatedOptionEnabled = !isRepeatedOptionEnabled;
    update();
    return isRepeatedOptionEnabled;
  }

  // toggle isAlarmOptionEnabled
  toggleAlarmOptionBoolean() {
    isAlarmOptionEnabled = !isAlarmOptionEnabled;
    update();
    return isAlarmOptionEnabled;
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
