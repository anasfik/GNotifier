import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/AppColors.dart';
import '../../view/general__widgets/dialog__text__button.dart';
import '../main__controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      content: Container(
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

  showSnackbar(String title, String message) {
    // Get.snackbar(
    //   "",
    //   "",
    //   titleText: Text(
    //     mainController.allFirstWordLetterToUppercase(title),
    //     style: TextStyle(
    //       color: Theme.of(Get.overlayContext!).backgroundColor,
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   messageText: Text(
    //     mainController.allFirstWordLetterToUppercase(message),
    //     style: TextStyle(
    //       color: Theme.of(Get.overlayContext!).backgroundColor.withOpacity(.8),
    //     ),
    //   ),
    //   backgroundColor: Theme.of(Get.overlayContext!).primaryColor,
    //   barBlur: 0,
    //   animationDuration: const Duration(milliseconds: 500),
    //   duration: const Duration(milliseconds: 3500),
    //   isDismissible: true,
    //   borderRadius: 100,
    //   colorText: Theme.of(Get.overlayContext!).backgroundColor,
    //   forwardAnimationCurve: Curves.easeInOutBack,
    //   icon: Icon(
    //     Icons.check,
    //     color: Theme.of(Get.overlayContext!).backgroundColor,
    //     size: 18,
    //   ),
    //   reverseAnimationCurve: Curves.easeInOutBack,
    //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
    //   overlayBlur: 0,
    //   dismissDirection: DismissDirection.horizontal,
    //   shouldIconPulse: false,
    // );
  }
}
