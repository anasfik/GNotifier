// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/mainController.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/general__widgets/text__field.dart';

import '../../../controllers/notificationsControllers/newItemNotificationController.dart';
import '../../general__widgets/action__button.dart';

class AddNewItemScreen extends StatelessWidget {
  AddNewItemScreen({Key? key}) : super(key: key);
  MainController mainController = Get.find();
NewNotificationController newNotificationController = Get.put(NewNotificationController());
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
              hintText: mainController.allFirstWordLetterToUppercase("title"),
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText:
                  mainController.allFirstWordLetterToUppercase("description"),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(
                  3,
                  (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 35,
                      ),
                      AutoSizeText(
                        "Schedule",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.darkBlack,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  
    
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
