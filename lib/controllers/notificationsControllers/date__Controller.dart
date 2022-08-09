// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../helpersControllers/dialogsController.dart';

class DateController extends GetxController {
  //depen. inj
  final DialogsController dialogsController = Get.put(DialogsController());

// variables

  DateTime? date;

  Future<DateTime?> _getDateFromUser() async {
    // showing datePicker dialog
    DateTime? date = await showDatePicker(
      context: Get.overlayContext as BuildContext,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      //giving the possibility for the user to choose time between now and the next 4 years
      lastDate: DateTime.now().add(Duration(days: 365 * 5)),
    );
    return date;
  }

  Future<TimeOfDay?> _getTimeFromUser() async {
    // showing datePicker dialog
    TimeOfDay? time = await showTimePicker(
      context: Get.overlayContext as BuildContext,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
    );
    return time;
  }

  Future<DateTime?> getFullDateFromUser() async {
    DateTime? date = await _getDateFromUser();
    TimeOfDay? time = await _getTimeFromUser();
    print("date: $date, time: $time");

    if (date != null && time != null) {
      return DateTime(date.year, date.month, date.day, time.hour, time.minute);
    } else {
      return dialogsController.showError("canceled");
    }
  }

  setFullDate(DateTime? gettedDateFromFunction) {
    date = gettedDateFromFunction;
    update();
  }

  //
}
