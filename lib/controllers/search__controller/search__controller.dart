import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';

class SearchController extends GetxController {
  TextEditingController searchBarController = TextEditingController();

  List<NewItemNotifcationModel> boxAsList =
      Hive.box<NewItemNotifcationModel>("newNotificationsBox").values.toList();

  List filterList(String textToFilterWith) {
    List processedList = boxAsList
        .where(
          (element) => element.title.toLowerCase().contains(
                textToFilterWith.toLowerCase(),
              ),
        )
        .toList();
    update();
    return processedList;
  }

  

}
