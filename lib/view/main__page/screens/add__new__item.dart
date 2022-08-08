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
                "New",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlack,
                ),
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
              SizedBox(height: 20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    3,
                    (index) => Column(
                      children: [
                        Icon(Icons.schedule),
                        AutoSizeText(
                          "Schedule",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.darkBlack,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
