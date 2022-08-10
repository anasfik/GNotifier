import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../helpersControllers/dialogsController.dart';

class NewNotificationController extends GetxController {
  // Dependency injection
  final DialogsController dialogsController = Get.put(DialogsController());

  // textEditingControllers
  late TextEditingController titleController;
  late TextEditingController descriptionController;

//
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
      await Future.delayed(Duration(milliseconds: 40));
      descriptionCountBoxScale = 1;
    }

    update();
  }

  // toggle isRepeatedOptionEnabled
  toggleRepeatedOptionBoolean() {
    isRepeatedOptionEnabled = !isRepeatedOptionEnabled;
    update();
  }

  // toggle isAlarmOptionEnabled
  toggleAlarmOptionBoolean() {
    isAlarmOptionEnabled = !isAlarmOptionEnabled;
    update();
  }

  @override
  void onInit() {
    titleController = TextEditingController(text: 'sfrfrsfrsfsrf');
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
