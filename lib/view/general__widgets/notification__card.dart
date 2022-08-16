import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/newItemNotificationModel.dart';
import '../../utils/AppColors.dart';
import 'favorite_icon__button.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    this.showDeleteButtonOnFullPage = false,
    required this.currentNotification,
    required this.reversedIndex,
    required this.title,
    required this.description,
    this.isFavoriteButtonHidden = false,
  }) : super(key: key);

  final NewItemNotifcationModel? currentNotification;
  final int reversedIndex;

  final String title, description;
  final bool isFavoriteButtonHidden, showDeleteButtonOnFullPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/notificationFullPage', arguments: [
          currentNotification,
          reversedIndex,
          showDeleteButtonOnFullPage,
        ]);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        height: 120,
        child: Row(
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    width: 3.5, color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              width: 7,
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.04),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        AutoSizeText(
                          title,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          maxFontSize: 20,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          description,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.6),
                              fontSize: 15),
                          maxFontSize: 15,
                          maxLines: 2,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Transform.scale(
                      scale: isFavoriteButtonHidden ? 0 : 1,
                      child: FavoriteIconButton(
                        isChecked: currentNotification?.isFavorite ?? false,
                        passedIndex: reversedIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 7 * 2,
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
