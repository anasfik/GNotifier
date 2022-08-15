import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/AppColors.dart';
import '../../view/general__widgets/dialog__text__button.dart';
import '../main__controller.dart';

class DialogsController extends GetxController {
  // Dependencies injection
  final MainController mainController = Get.put(MainController());

  //
  showConfirmWithActions(
    String infoText,
    String actionButtonText,
    void Function()? function,
  ) {
    Get.defaultDialog(
      title: "",
      backgroundColor: AppColors.lightGrey,
      radius: 5,
      barrierDismissible: false,
      content: Column(
        children: [
          Icon(
            Icons.check,
            color: AppColors.darkBlack,
            size: 60,
          ),
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
        DialogTextButton(
          hasBackground: false,
          mainController: mainController,
          text: "no",
          onPressed: () {
            Get.back();
          },
        ),
        DialogTextButton(
          mainController: mainController,
          onPressed: function,
          text: actionButtonText,
          hasBackground: true,
        ),
      ],
    );
  }

  //
  showInfo(String infoText) {
    Get.defaultDialog(
      title: "",
      backgroundColor: AppColors.lightGrey,
      radius: 5,
      content: Column(
        children: [
          Icon(
            Icons.info,
            color: AppColors.darkBlack,
            size: 60,
          ),
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
        DialogTextButton(
          hasBackground: false,
          mainController: mainController,
          text: "ok",
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
