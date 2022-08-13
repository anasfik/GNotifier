// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/helpersControllers/dialogsController.dart';
import 'package:watch_it_later/controllers/mainController.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/general__widgets/action__button.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';

import '../../controllers/notificationsControllers/date__Controller.dart';
import '../../controllers/notificationsControllers/newItemNotificationController.dart';
import '../../model/newItemNotificationModel.dart';
import '../general__widgets/edit__icon__button.dart';
import '../general__widgets/favorite_icon__button.dart';

class NotificationFullPage extends StatelessWidget {
  NotificationFullPage({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());
  final NewNotificationController newNotificationController =
      Get.put(NewNotificationController());
  DateController dateController = Get.put(DateController());
  final DialogsController dialogsController = Get.put(DialogsController());
  // we got those with Get.arguments from previous page
  // it's weird but I see it best solution to pass arguments to a page
  NewItemNotifcationModel gettedNotification = Get.arguments[0];
  int reversedIndex = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: AppColors.darkBlack),
        backgroundColor: AppColors.lightGrey,
        elevation: 0,
        actions: [
          FavoriteIconButton(
            isChecked: gettedNotification.isFavorite as bool,
            passedIndex: reversedIndex,
            size: 28,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GetBuilder<NewNotificationController>(
                    init: NewNotificationController(),
                    builder: (newNotificationController) {
                      return AutoSizeText(
                        mainController.allFirstWordLetterToUppercase(
                            newNotificationController.newTitle ??
                                gettedNotification.title),
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                EditIconButton(
                  onTap: () {
                    newNotificationController.showEditDialog(
                      mainController.allFirstWordLetterToUppercase("title"),
                      gettedNotification,
                      reversedIndex,
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBlack.withOpacity(.8),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 60,
                  height: 4,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBlack,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 5,
                  height: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBlack,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 5,
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GetBuilder<NewNotificationController>(
                    // we don't have really to re init this controller every time
                    builder: (newNotificationController) {
                      return AutoSizeText(
                        mainController.allFirstWordLetterToUppercase(
                          newNotificationController.newDescription ??
                              gettedNotification.description,
                        ),
                        maxLines: 5,
                        style: TextStyle(
                          color: AppColors.darkBlack.withOpacity(.7),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                EditIconButton(
                  onTap: () {
                    newNotificationController.showEditDescriptionDialog(
                      mainController
                          .allFirstWordLetterToUppercase("description"),
                      gettedNotification,
                    );
                  },
                ),
              ],
            ),
            Spacer(),
            GetBuilder<NewNotificationController>(
              init: NewNotificationController(),
              builder: (newNotificationController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          print(newNotificationController.newDate ??
                              gettedNotification.dateToShow);
                          //
                          newNotificationController.newDate =
                              dateController.setFullDate(
                                  await dateController.getFullDateFromUser(
                                      gettedDate:
                                          gettedNotification.dateToShow));
                          //
                          print(newNotificationController.newDate ??
                              gettedNotification.dateToShow);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 35,
                            ),
                            AutoSizeText(
                              mainController
                                  .allFirstWordLetterToUppercase("date"),
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.darkBlack,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // print(
                          //     "${newNotificationController.isRepeatedOptionEnabled}, ${newNotificationController.isAlarmOptionEnabled}");
                          print(newNotificationController.newIsRepeated ??
                              gettedNotification.isRepeated);
                          //
                          newNotificationController.newIsRepeated =
                              newNotificationController
                                  .toggleRepeatedOptionBoolean();
                          //
                          print(newNotificationController.newIsRepeated ??
                              gettedNotification.isRepeated);
                        },
                        child: Opacity(
                          opacity:
                              newNotificationController.isRepeatedOptionEnabled
                                  ? 1
                                  : .55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.repeat,
                                size: 35,
                              ),
                              AutoSizeText(
                                mainController
                                    .allFirstWordLetterToUppercase("repeated"),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.darkBlack,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print(newNotificationController.newIsAlarmed ??
                              gettedNotification.isAlarmed);
                          //
                          newNotificationController.newIsAlarmed =
                              newNotificationController
                                  .toggleAlarmOptionBoolean();
                          //
                          print(newNotificationController.newIsAlarmed ??
                              gettedNotification.isAlarmed);
                        },
                        child: Opacity(
                          opacity:
                              newNotificationController.isAlarmOptionEnabled
                                  ? 1
                                  : .55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.alarm,
                                size: 35,
                              ),
                              AutoSizeText(
                                mainController
                                    .allFirstWordLetterToUppercase("alarm"),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.darkBlack,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 10,
                    child: CustomButton(
                      radiusValue: 10,
                      shouldReverseColors: true,
                      onPressed: () {
                        dialogsController.showConfirmWithActions(
                          mainController.allFirstWordLetterToUppercase(
                              "are you sure you want to update it ?"),
                          mainController.allFirstWordLetterToUppercase("yes"),
                          () {
                            newNotificationController.updateNotification(
                              reversedIndex,
                              newNotificationController.newTitle ??
                                  gettedNotification.title,
                              newNotificationController.newDescription ??
                                  gettedNotification.description,
                              newNotificationController.newDate ??
                                  gettedNotification.dateToShow,
                              newNotificationController.newIsRepeated ??
                                  gettedNotification.isRepeated,
                              newNotificationController.newIsAlarmed ??
                                  gettedNotification.isAlarmed,
                              gettedNotification.isFavorite as bool,
                            );

                            Get.back();
                          },
                        );
                      },
                      text: mainController
                          .allFirstWordLetterToUppercase("update"),
                    ),
                  ),
                  if (Get.arguments[2] == true) ...[
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.withOpacity(.15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            newNotificationController
                                .deleteNotification(reversedIndex);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
