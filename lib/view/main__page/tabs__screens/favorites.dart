import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/controllers/favorites__controller.dart/favorites__controller.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';
import 'package:watch_it_later/view/general__widgets/notification__card.dart';

import '../../../controllers/mainController.dart';
import '../../../controllers/test.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  final test = Get.lazyPut(() => Test());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            AutoSizeText(
              mainController
                  .allFirstWordLetterToUppercase("Saved notifications"),
              maxLines: 2,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            const SizedBox(height: 20),
            Column(
              children: [
                ...List.generate(
                  favoritesController.favoritesItemsNotificationList.length,
                  (index) {
                    // our list
                    List<NewItemNotifcationModel> favList =
                        favoritesController.favoritesItemsNotificationList;

                    // from end to start
                    int reversedIndex = favList.length - 1 - index;
                    return NotificationCard(
                      currentNotification:
                          favList[reversedIndex] as NewItemNotifcationModel,
                      reversedIndex: index,
                      // "favList.length - 1" get us to lase item, with "- index", so like we say we should start from the end
                      title: favList[reversedIndex].title,
                      description: favList[reversedIndex].description,
                      isFavoriteButtonHidden: true,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
