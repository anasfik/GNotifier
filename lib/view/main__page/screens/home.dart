// ignore_for_file: prefer_const_constructors

import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../controllers/mainController.dart';
import '../../../model/newItemNotificationModel.dart';
import '../../../utils/AppColors.dart';
import '../../general__widgets/action__button.dart';
import '../../general__widgets/icon__button.dart';
import '../../general__widgets/notification__card.dart';
import 'add__new__item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

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
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Hive.box<NewItemNotifcationModel>("newNotificationsBox")
                          .values
                          .toList()
                          .forEach((element) {
                        print("${element.key}, ${element.isFavorite}");
                      });
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                  ),
                  OpenContainer(
                    closedElevation: 0,
                    closedBuilder: (context, action) {
                      return CustomActionIconButton(
                        icon: Icons.add,
                      );
                    },
                    openBuilder: (context, action) {
                      return AddNewItemScreen();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            AutoSizeText.rich(
              TextSpan(
                text: mainController.allFirstWordLetterToUppercase("Hey, "),
                children: [
                  TextSpan(
                    text: mainController.allFirstWordLetterToUppercase("anas"),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            AutoSizeText(
              mainController
                  .allFirstWordLetterToUppercase("latest added notification"),
              maxLines: 2,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable:
                    Hive.box<NewItemNotifcationModel>("newNotificationsBox")
                        .listenable(),
                builder: (BuildContext context,
                    Box<NewItemNotifcationModel> box, __) {
                  if (box.values.isEmpty)
                    return Center(
                      child: Text("No notifications"),
                    );
                  return Column(
                    children: [
                      ...List.generate(box.values.length, (index) {
                        // making the read of the iterable start from the end
                        // ...length -1 get us to last element, since index start from 0, this will work as we want
                        int reversedIndex = box.values.length - 1 - index;
                        NewItemNotifcationModel? currentNotification =
                            box.getAt(reversedIndex);

                        return NotificationCard(
                          currentNotification: currentNotification,
                          reversedIndex: reversedIndex,
                          title: currentNotification!.title,
                          description: currentNotification.description,
                        );
                      }),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
