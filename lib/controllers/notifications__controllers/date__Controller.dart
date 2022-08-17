import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers__controllers/dialogs__controller.dart';

class DateController extends GetxController {
  //dependency injection
  final DialogsController dialogsController = Get.put(DialogsController());

  // Variables
  DateTime? date;
  DateTime? selecteDate;
  // get the just the date(years, months, days)
  Future<DateTime?> _getDateFromUser({DateTime? gettedDate}) async {
    // showing datePicker dialog
    DateTime? date = await showDatePicker(
      context: Get.overlayContext as BuildContext,
      initialDate: gettedDate ?? selecteDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      //giving the possibility for the user to choose time between now and the next 5 years
      lastDate: DateTime.now().add(
        Duration(days: 365 * 5),
      ),
    );
    return date;
  }

// get just the time (hours, minutes)
  Future<TimeOfDay?> _getTimeFromUser({DateTime? gettedDate}) async {
    // showing timePicker dialog
    TimeOfDay? time = await showTimePicker(
      context: Get.overlayContext as BuildContext,
      initialTime: gettedDate != null
          ? TimeOfDay.fromDateTime(gettedDate)
          : selecteDate != null
              ? TimeOfDay.fromDateTime(selecteDate!)
              : TimeOfDay.now(),
      // TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
    );
    return time;
  }

// get the full date with time (years, months, days, hours, minutes)
  Future<DateTime?> getFullDateFromUser({DateTime? gettedDate}) async {
    //
    DateTime? date = await _getDateFromUser(gettedDate: gettedDate);
    TimeOfDay? time = await _getTimeFromUser(gettedDate: gettedDate);

    if (date != null && time != null) {
      return DateTime(date.year, date.month, date.day, time.hour, time.minute);
    } else {
      // note !
      return null;
    }
  }

// set it
  setFullDate(DateTime? gettedDateFromFunction) {
    date = gettedDateFromFunction;
    selecteDate = gettedDateFromFunction;
    update();

    return date;
  }

  @override
  void onReady() {
    // I don't see there is other handling for errors for this

    super.onReady();
  }
}
