// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/controllers/helpersControllers/dialogsController.dart';
import 'package:watch_it_later/controllers/mainController.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/general__widgets/text__field.dart';

import '../../../controllers/notificationsControllers/date__Controller.dart';
import '../../../controllers/notificationsControllers/newItemNotificationController.dart';
import '../../../model/newItemNotificationModel.dart';
import '../../general__widgets/action__button.dart';

class AddNewItemScreen extends StatelessWidget {
  AddNewItemScreen({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());
  final DateController dateController = Get.put(DateController());
  NewNotificationController newNotificationController =
      Get.put(NewNotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomActionIconButton(
                    shouldReverseColors: true, icon: Icons.close),
              ),
            ),
            AutoSizeText(
              "New",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlack,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AutoSizeText(
              mainController.allFirstWordLetterToUppercase(
                  "write the title and description of your notification and set a schedule"),
              style: TextStyle(
                fontSize: 20,
                color: AppColors.darkBlack.withOpacity(.55),
              ),
              maxLines: 3,
            ),
            Spacer(),
            CustomTextField(
              controller: newNotificationController.titleController,
              hintText: mainController.allFirstWordLetterToUppercase("title"),
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: newNotificationController.descriptionController,
              hintText:
                  mainController.allFirstWordLetterToUppercase("description"),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                            dateController.setFullDate(
                                await dateController.getFullDateFromUser());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
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
                            newNotificationController
                                .toggleRepeatedOptionBoolean();

                            print(
                                "${newNotificationController.isRepeatedOptionEnabled}, ${newNotificationController.isAlarmOptionEnabled}");
                          },
                          child: Opacity(
                            opacity: newNotificationController
                                    .isRepeatedOptionEnabled
                                ? 1
                                : .55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.repeat,
                                  size: 35,
                                ),
                                AutoSizeText(
                                  mainController.allFirstWordLetterToUppercase(
                                      "repeated"),
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
                            newNotificationController
                                .toggleAlarmOptionBoolean();
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
                                Icon(
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
                }),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  Box<NewItemNotifcationModel> newNotificationsBox =
                      Hive.box<NewItemNotifcationModel>("newNotificationsBox");
                  newNotificationsBox.add(
                    NewItemNotifcationModel(
                      newNotificationController.titleController.text.trim(),
                      newNotificationController.descriptionController.text
                          .trim(),
                      dateController.date as DateTime,
                      newNotificationController.isRepeatedOptionEnabled,
                      newNotificationController.isAlarmOptionEnabled,
                      false
                    ),
                  );
                  Get.back();
                },
                text: mainController.allFirstWordLetterToUppercase("create"),
                shouldReverseColors: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
