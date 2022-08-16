// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/helpers__controllers/dialogs__controller.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/add_new_item/widgets/option.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/notification__full__page/widgets/dashed__lines__decoration.dart';

import '../../controllers/notifications__controllers/date__Controller.dart';
import '../../controllers/notifications__controllers/new__item__notification__controller.dart';
import '../../model/newItemNotificationModel.dart';
import '../general__widgets/edit__icon__button.dart';
import '../general__widgets/favorite_icon__button.dart';
import 'delete__button.dart';
import 'widgets/full__screen__notification__description.dart';
import 'widgets/full__screen__notification__title.dart';

class NotificationFullPage extends StatelessWidget {
  NotificationFullPage({Key? key}) : super(key: key);

  // Dependency injection
  final MainController mainController = Get.put(MainController());
  final NewNotificationController newNotificationController =
      Get.put(NewNotificationController());
  DateController dateController = Get.put(DateController());
  final DialogsController dialogsController = Get.put(DialogsController());

  ///
  // we got those with Get.arguments from previous page
  // it's weird but I see it best solution to pass arguments to a page
  NewItemNotifcationModel gettedNotification = Get.arguments[0];
  int reversedIndex = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
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
                      return FullScreenNotificationTitle(
                        text: newNotificationController.newTitle ??
                            gettedNotification.title,
                        mainController: mainController,
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
            //
            DashedLinesDecoration(),

            //
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
                      return FullScreenNotificationDescription(
                        mainController: mainController,
                        text: newNotificationController.newDescription ??
                            gettedNotification.description,
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
                          newNotificationController.newDate =
                              dateController.setFullDate(
                            await dateController.getFullDateFromUser(
                                gettedDate: gettedNotification.dateToShow),
                          );
                        },
                        child: Option(
                            mainController: mainController,
                            text: "date",
                            icon: Icons.calendar_month_outlined),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          newNotificationController.newIsRepeated =
                              newNotificationController
                                  .toggleRepeatedOptionBoolean();
                        },
                        child: Opacity(
                          opacity:
                              newNotificationController.isRepeatedOptionEnabled
                                  ? 1
                                  : .55,
                          child: Option(
                              mainController: mainController,
                              text: "repeated",
                              icon: Icons.repeat),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          newNotificationController.newIsAlarmed =
                              newNotificationController
                                  .toggleAlarmOptionBoolean();
                        },
                        child: Opacity(
                          opacity:
                              newNotificationController.isAlarmOptionEnabled
                                  ? 1
                                  : .55,
                          child: Option(
                              mainController: mainController,
                              text: "alarm",
                              icon: Icons.alarm),
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
            SizedBox(
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
                          "are you sure you want to update it ?",
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
                    DeleteButton(
                      newNotificationController: newNotificationController,
                      reversedIndex: reversedIndex,
                      onPressed: () {
                        dialogsController.showConfirmWithActions(
                            "are you sure to delete this ?", "delete", () {
                          newNotificationController
                              .deleteNotification(reversedIndex);
                          Get.back();
                        }, forDelete: true);
                      },
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
