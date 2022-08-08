// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/mainController.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/general__widgets/text__field.dart';

class AddNewItemScreen extends StatelessWidget {
  AddNewItemScreen({Key? key}) : super(key: key);
  MainController mainController = Get.find();

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
              AutoSizeText(
                "Add new item",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlack,
                ),
              ),
              AutoSizeText(
                mainController.allFirstWordLetterToUppercase(
                    "write the title and description of your notifivation and set a schedule for it"),
                style: TextStyle(
                  color: AppColors.darkBlack,
                ),
                maxLines: 2,
              ),
              CustomTextField(
                hintText: mainController.allFirstWordLetterToUppercase("title"),
              ),
              CustomTextField(
                hintText:
                    mainController.allFirstWordLetterToUppercase("description"),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              )
            ],
          ),
        ));
  }
}
