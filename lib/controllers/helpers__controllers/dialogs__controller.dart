import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/AppColors.dart';
import '../../view/general__widgets/dialog__text__button.dart';
import '../main__controller.dart';

class DialogsController extends GetxController {


  // Dependencies injection
  final MainController mainController = Get.put(MainController());


 
  showConfirmWithActions(
      String infoText, String actionButtonText, void Function()? function,
      {forDelete = false}) {
    Get.defaultDialog(
      title: "",
      backgroundColor: AppColors.lightGrey,
      radius: 5,
      barrierDismissible: false,
      content: Column(
        children: [
          Icon(
            forDelete ? Icons.delete : Icons.check,
            color: forDelete ? Colors.red : Theme.of(Get.context!).primaryColor,
            size: 60,
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 200,
            child: Text(
              mainController.allFirstWordLetterToUppercase(infoText),
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      actions: [
        DialogTextButton(
          hasBackground: false,
          mainController: mainController,
          text: "no",
          onPressed: () {
            Get.back();
          },
        ),
        DialogTextButton(
          forDelete: true,
          mainController: mainController,
          onPressed: function,
          text: actionButtonText,
          hasBackground: true,
        ),
      ],
    );
  }

  //
  showInfo(String infoTitle, String infoText) {
    Get.defaultDialog(
      title: "",
      backgroundColor: AppColors.lightGrey,
      radius: 5,
      contentPadding: EdgeInsets.only(right: 20),
      content: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              mainController.allFirstWordLetterToUppercase(infoTitle),
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            AutoSizeText(
              mainController.allFirstWordLetterToUppercase(infoText),
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: DialogTextButton(
            hasBackground: false,
            mainController: mainController,
            text: "ok",
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    );
  }
}
