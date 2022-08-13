import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/AppColors.dart';
import '../mainController.dart';

class DialogsController extends GetxController {
  final MainController mainController = Get.put(MainController());
  showConfirmWithActions(
      String infoText, String actionButtonText, void Function()? function) {
    Get.defaultDialog(
      title: "",
      backgroundColor: AppColors.lightGrey,
      content: Column(
        children: [
          Icon(Icons.check, color: AppColors.darkBlack, size: 60),
          const SizedBox(height: 15),
          SizedBox(
            width: 200,
            child: Text(
              infoText,
              style: TextStyle(
                color: AppColors.darkBlack,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            mainController.allFirstWordLetterToUppercase("no"),
            style: TextStyle(
                color: AppColors.darkBlack.withOpacity(.6),
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: AppColors.darkBlack),
            onPressed: function,
            child: Text(
              mainController.allFirstWordLetterToUppercase(actionButtonText),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
      radius: 5,
    );
  }

  showError(String errorText) {
    Get.defaultDialog(
        title: "",
        backgroundColor: const Color(0xff131429),
        content: Column(
          children: [
            const Icon(Icons.error, color: Colors.red, size: 60),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: Text(
                errorText,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }

  //
  showSuccess(String successText) {}
}
