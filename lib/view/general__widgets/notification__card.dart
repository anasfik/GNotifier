import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/main__controller.dart';

import '../../model/newItemNotificationModel.dart';
import 'favorite_icon__button.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({
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
  MainController mainController = Get.put(MainController());
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          mainController.allFirstWordLetterToUppercase(title),
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
                    top: 4,
                    right: 4,
                    child: Transform.scale(
                      scale: isFavoriteButtonHidden ? 0 : 1,
                      child: FavoriteIconButton(
                        size: 23,
                        isChecked: currentNotification?.isFavorite ?? false,
                        passedIndex: reversedIndex,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (currentNotification!.isRepeated) ...[
                          Icon(
                            Icons.repeat,
                            size: 12,
                            color:
                                Theme.of(context).primaryColor.withOpacity(.3),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                        if (currentNotification!.hasAutoDelete) ...[
                          Icon(
                            Icons.auto_delete,
                            size: 12,
                            color:
                                Theme.of(context).primaryColor.withOpacity(.3),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                        Icon(
                          Icons.schedule,
                          size: 12,
                          color: Theme.of(context).primaryColor.withOpacity(.3),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AutoSizeText(
                          setDateShow(currentNotification!.dateToShow),
                          style: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.3),
                            fontSize: 8,
                          ),
                          maxLines: 1,
                        ),
                      ],
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

  String setDateShow(DateTime dateToShow) {
// write date properly

    int years = dateToShow.year;
    int months = dateToShow.month;
    int days = dateToShow.day;
    int hours = dateToShow.hour;
    int minutes = dateToShow.minute;
    String date =
        "$years-$months-$days  $hours:${minutes.toString().padLeft(2, '0')}";
    return date;
  }
}
