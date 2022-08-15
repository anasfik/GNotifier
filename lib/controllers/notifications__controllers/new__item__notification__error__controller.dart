import 'package:get/get.dart';

import '../helpers__controllers/dialogs__controller.dart';

class NewNotificationExceptionsHandler extends GetxController {
  final DialogsController dialogsController = Get.put(DialogsController());
  // Check tittle
  checkTitleValidity(String title) {
    if (title.isEmpty) {
      dialogsController.showInfo(
          "Title is empty", "please, set a title for your notification");
      return;
    }
  }

// Check description
  checkDescriptionValidity(String description) {
    if (description.isEmpty) {
      dialogsController.showInfo("description is empty",
          "please, set a description for your notification");
      return;
    }
  }

  // Check dateTime (year, month, day)
  checkDateTimeValidity(DateTime? date) {
    if (date?.year == null && date?.month == null && date?.day == null) {
      dialogsController.showInfo("no date selected",
          "please, choose the schedule date for your notification");
      return;
    }
  }

  // Check TimeOfDay (hours, minutes)
  checkTimeDateValidity(DateTime? date) {
     if (date?.hour == null && date?.minute == null) {
      dialogsController.showInfo("no hours / minutes selected",
          "please, set a specific time for scheduling your notification");
      return;
    }
  }

  //
  checkFullTimeValidity(DateTime? date) {
      // get back if in somehow the user choosed a date in the past
    if (date!.isBefore(DateTime.now())) {
      dialogsController.showInfo("date not accepted",
          "we can't show you a notification in the past, please, pick a schedule date");
      return;
    }
  }
}
