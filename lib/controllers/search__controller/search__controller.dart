import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';

class SearchController extends GetxController {
  // Search text field controller
  TextEditingController searchBarController = TextEditingController();

  // Convert the box to list
  List<NewItemNotifcationModel> boxAsList =
      Hive.box<NewItemNotifcationModel>("newNotificationsBox").values.toList();

  // Filter method
  List filterList(String textToFilterWith) {
    // given the ability to search with title and description
    List processedList = boxAsList.where(
      (element) {

        // Filter with anything from the model (except booleans ofc)
        return (element.title.toLowerCase().contains(
                  textToFilterWith.toLowerCase(),
                )) ||
            (element.description.toLowerCase().contains(
                  textToFilterWith.toLowerCase(),
                )) ||
            element.dateToShow.day.toString().toLowerCase().contains(
                  textToFilterWith.toLowerCase(),
                  
                )  ||
            element.dateToShow.year.toString().toLowerCase().contains(
                  textToFilterWith.toLowerCase(),
                )  ||
            element.dateToShow.month.toString().toLowerCase().contains(
                  textToFilterWith.toLowerCase(),
                );
      },

      // Note: where return an iterable, we should convert it to list as well
    ).toList();

    //
    update();

    //
    return processedList;
  }

  @override
  void onClose() {
    searchBarController.dispose();
    super.onClose();
  }
}
