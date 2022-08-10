import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';

class SearchController extends GetxController {
  // search text field controller
  TextEditingController searchBarController = TextEditingController();
// Variables

  // convert the box to list
  List<NewItemNotifcationModel> boxAsList =
      Hive.box<NewItemNotifcationModel>("newNotificationsBox").values.toList();

// filter method
  List filterList(String textToFilterWith) {
    // given the ability to search with title and description
    List processedList = boxAsList.where(
      (element) {
        return (element.title.toLowerCase().contains(
                  textToFilterWith.toLowerCase(),
                )) ||
            (element.description.toLowerCase().contains(
                  textToFilterWith.toLowerCase(),
                ));
      },
      // note: where return an iterable, we should convert it to list as well
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
