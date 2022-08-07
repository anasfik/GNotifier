// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/mainController.dart';
import '../../../utils/AppColors.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            SizedBox(height: 20),
            AutoSizeText(
              mainController.allFirstWordLetterToUppercase("settings"),
              maxLines: 2,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            //

            //
            SizedBox(height: 20),

            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              children: [
                ...List.generate(
                  6,
                  (index) => Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.darkBlack.withOpacity(.05),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.brightness_2,
                          color: AppColors.darkBlack.withOpacity(.45),
                          size: 35,
                        ),
                        Spacer(),
                        AutoSizeText(
                          mainController
                              .allFirstWordLetterToUppercase("dark mode"),
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AutoSizeText(
                            mainController.allFirstWordLetterToUppercase(
                                "Switch app theme to dark / light mode"),
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.darkBlack.withOpacity(.65),
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List settingsBoxContents = [
  {
    "title": "dark mode",
    "icon": Icons.brightness_2,
  },
  {
    "title": "delete notes",
    "icon": Icons.notes,
  },
  {
    "title": "about",
    "icon": Icons.info,
  },
  {
    "title": "logout",
    "icon": Icons.exit_to_app,
  }
];
