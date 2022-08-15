import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/controllers/favorites__controller.dart/favorites__controller.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';
import 'package:watch_it_later/view/general__widgets/notification__card.dart';
import '../../../controllers/mainController.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  // Dependencies injection
  final MainController mainController = Get.put(MainController());
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Page title
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

            // Favorite notifications list
            ValueListenableBuilder(
                valueListenable:
                    Hive.box<NewItemNotifcationModel>("newNotificationsBox")
                        .listenable(),
                builder: (BuildContext context,
                    Box<NewItemNotifcationModel> box, __) {
                  return Column(
                    children: [
                      ...List.generate(
                        box.values.length,
                        (index) {
                          // reversedIndex
                          int reversedIndex = box.values.length - 1 - index;

                          // currentNotification
                          NewItemNotifcationModel? currentNotification =
                              box.getAt(reversedIndex);

                          // isFavorite condition
                          if (currentNotification!.isFavorite!) {
                            return NotificationCard(
                              currentNotification: currentNotification,
                              reversedIndex: index,
                              // "favoritesController.favoritesItemsNotificationList.length - 1" get us to lase item, with "- index", so like we say we should start from the end
                              title: currentNotification.title,
                              description: currentNotification.description,
                              isFavoriteButtonHidden: true,
                            );
                          }

                          // work like nothing
                          return Container();
                        },
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
