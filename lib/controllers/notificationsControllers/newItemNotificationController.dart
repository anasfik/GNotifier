// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NewNotificationController extends GetxController {
  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<DateTime?> getDateFromUser() async {
    DateTime? date = await showDatePicker(
      context: Get.overlayContext as BuildContext,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      //giving the possibility for the user to choose time between now and the next 4 years 
      lastDate: DateTime.now().add(Duration(days: 365 * 5)),
    );

    return date;
  }
}
