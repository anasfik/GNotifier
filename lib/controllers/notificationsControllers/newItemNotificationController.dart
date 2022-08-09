// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../helpersControllers/dialogsController.dart';

class NewNotificationController extends GetxController {
  //depen. inj
  final DialogsController dialogsController = Get.put(DialogsController());

//variables
  bool isRepeatedOptionEnabled = true;
  bool isAlarmOptionEnabled = false;

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  toggleRepeatedOptionBoolean() {
    isRepeatedOptionEnabled = !isRepeatedOptionEnabled;
    update();
  }

  toggleAlarmOptionBoolean() {
    isAlarmOptionEnabled = !isAlarmOptionEnabled;
    update();
  }
}
