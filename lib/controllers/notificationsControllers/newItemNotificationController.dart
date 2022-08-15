import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:watch_it_later/view/notification__full__page/widgets/bottom__sheet_widget.dart';
import '../../model/newItemNotificationModel.dart';
import '../../services/local__notifications__service.dart';
import '../favorites__controller.dart/favorites__controller.dart';
import '../helpersControllers/dialogsController.dart';
import '../mainController.dart';

import 'package:timezone/timezone.dart' as tz;

class NewNotificationController extends GetxController {
  // Dependency injection
  final DialogsController dialogsController = Get.put(DialogsController());
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  final MainController mainController = Get.put(MainController());

  ///
  // NotificationService instance
  // uncommenting this will cause a stack overflow
  // final NotificationService notificationService = NotificationService();
  ///

  // New item  Text editing controllers
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  // TextFields keys
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

  // Variables that will take the new data to update the notification
  String? newTitle;
  String? newDescription;
  bool? newIsAlarmed;
  bool? newIsRepeated;
  DateTime? newDate;

  // Add new item method
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
    int newId = Random().nextInt(1000000);
    newNotificationsBox.add(
      NewItemNotifcationModel(
        title,
        description,
        date,
        isRepeated,
        isAlarm,
        // isFavorite: false by default :
        false,
        // id
        newId,
      ),
    );

    ///
    // Using openContainer from the animations package trait the AddNewNotificationPage as just a widget so open/close it execute the dispose to text editing controllers so we should re-init them after any add operations
    titleController.text = "";
    descriptionController.text = "";

    /// Pushing the notification
    // Instance of service
    final NotificationService notificationService = NotificationService();

    // Get difference between the current date and the notification date
    Duration difference = date.difference(DateTime.now());

    // Create it
    notificationService.createScheduledNotification(
      newId,
      title,
      description,
      tz.TZDateTime.now(tz.local).add(
        Duration(
          seconds: difference.inSeconds,
        ),
      ),
      "$newId",
    );

    // Going back
    Get.back();
  }

  // Delete notification
  deleteNotification(int index) {
    // Init the hive box
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");

    // delete it from box
    newNotificationsBox.deleteAt(index);

    // this is optional but there is a 1% case that need it so, it's important
    update();

    // Going back
    Get.back();
  }

  // This shows the bottom sheet for update title
  showEditDialog(String hint, NewItemNotifcationModel gettedNotification,
      int reversedIndex) {
    // First set an init value whenever we open the bottom sheet
    titleController.text = newTitle ?? gettedNotification.title;

    // For first time it will for sure be the titleController.text so
    countTitleLength(titleController.text);
    update();

    // Open the bottom sheet
    Get.bottomSheet(
      BottomSheetWidget(
        // Success method
        onSuccess: () {
          setNewTitle(titleController.text);
        },

        // Specify the type of the bottom sheet
        forTitle: true,

        hint: hint,

        gettedNotification: gettedNotification,
      ),
    );
  }

  // This shows the bottom sheet for update description
  showEditDescriptionDialog(
    String hint,
    NewItemNotifcationModel gettedNotification,
  ) {
    // First set an init value whenever we open the bottom sheet
    descriptionController.text =
        newDescription ?? gettedNotification.description;

    // For first time it will for sure be the descriptionController.text so
    countTitleLength(descriptionController.text);
    update();

    // Open the bottom sheet
    Get.bottomSheet(BottomSheetWidget(
      // Success method
      onSuccess: () {
        setNewDescription(descriptionController.text);
      },
      // Specify the type of the bottom sheet
      forDescription: true,
      hint: hint,
      gettedNotification: gettedNotification,
    ));
  }

//

  // Set the updated title to newTitle variable
  setNewTitle(String value) {
    // Store it
    newTitle = value;

    // Now we change the textField value to the new value
    titleController.text = newTitle!;
    update();

    // Going back
    Get.back();
  }

  // Give the updated description to newTitle variable
  setNewDescription(String value) {
    // Store it
    newDescription = value;

    // Now we change the textField value to the new value
    descriptionController.text = newDescription!;
    update();

    // Going back
    Get.back();
  }

  // Edit notification
  updateNotification(int index, String title, String description, DateTime date,
      bool isRepeated, bool isAlarm, bool isFavorite) {
    // Init the hive box
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");
    // And update it in box
    newNotificationsBox.putAt(
      index,
      NewItemNotifcationModel(
        title,
        description,
        date,
        isRepeated,
        isAlarm,
        isFavorite,
        newNotificationsBox.getAt(index)!.id,
      ),
    );

    ///
    // Instance of service
    final NotificationService notificationService = NotificationService();
    // cancel the pending one
    notificationService
        .cancelNotificationWithId(newNotificationsBox.getAt(index)!.id);

    // Get difference
    Duration difference = date.difference(DateTime.now());

    // Create a new one with the new data
    notificationService.createScheduledNotification(
        newNotificationsBox.getAt(index)!.id,
        title,
        description,
        // This will show it after 5 secondes from the current time
        tz.TZDateTime.now(tz.local).add(
          Duration(
            seconds: difference.inSeconds,
          ),
        ),
        "${newNotificationsBox.getAt(index)!.id}");

    // Going back
    Get.back();
  }

  // Method handler for title text field
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

  // Method handler for description text field
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

  // Toggle isRepeatedOptionEnabled
  toggleRepeatedOptionBoolean() {
    isRepeatedOptionEnabled = !isRepeatedOptionEnabled;
    update();
    return isRepeatedOptionEnabled;
  }

  // Toggle isAlarmOptionEnabled
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
