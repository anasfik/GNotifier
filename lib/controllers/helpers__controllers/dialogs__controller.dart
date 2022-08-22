import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/AppColors.dart';
import '../../view/general__widgets/dialog__text__button.dart';
import '../main__controller.dart';
import 'package:oktoast/oktoast.dart';

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
            color: forDelete ? Colors.red[800] : AppColors.darkBlack,
            size: 60,
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 200,
            child: Text(
              mainController.allFirstWordLetterToUppercase(infoText),
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
          forDelete: forDelete,
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
      contentPadding: const EdgeInsets.only(right: 20),
      content: RepaintBoundary(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                mainController.allFirstWordLetterToUppercase(infoTitle),
                style: TextStyle(
                  color: AppColors.darkBlack,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              AutoSizeText(
                mainController.allFirstWordLetterToUppercase(infoText),
                style: TextStyle(
                  color: AppColors.darkBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 3,
              ),
            ],
          ),
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

  showSnackbar(String title) {
    showToastWidget(
      Container(
        padding: const EdgeInsets.only(
          top: 14,
          bottom: 14,
          left: 20,
          right: 10,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Theme.of(Get.overlayContext!).primaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Theme.of(Get.overlayContext!).backgroundColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                mainController.allFirstWordLetterToUppercase(title),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(Get.overlayContext!).backgroundColor,
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
      textDirection: TextDirection.ltr,
      position: ToastPosition.top,
    );
  }
}
