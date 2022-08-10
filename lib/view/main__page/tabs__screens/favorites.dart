// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/favorites__controller.dart/favorites__controller.dart';
import 'package:watch_it_later/view/general__widgets/notification__card.dart';

import '../../../controllers/mainController.dart';
import '../../../utils/AppColors.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            SizedBox(height: 20),
            AutoSizeText(
              mainController
                  .allFirstWordLetterToUppercase("Saved notifications"),
              maxLines: 2,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            SizedBox(height: 20),
            Column(
              children: [
                ...List.generate(
                  favoritesController.favoritesItemsNotificationList.length,
                  (index) => NotificationCard(
                    reversedIndex: index,
                    title: favoritesController
                        .favoritesItemsNotificationList[favoritesController
                                .favoritesItemsNotificationList.length -
                            1 -
                            index]
                        .title,
                    description: favoritesController
                        .favoritesItemsNotificationList[index].description,
                    isFavoriteButtonHidden: true,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
