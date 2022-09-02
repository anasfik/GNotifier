import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  @override
  void onInit() {
    textAreaEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textAreaEditingController.dispose();
    super.onClose();
  }

  // text area controller
  late TextEditingController textAreaEditingController;

  // Contact text area text variables
  int contactTextMaxLength = 250;
  int contactTextWrittenLength = 0;
  double contactTextCountBoxScale = 0;

  // count method
  // Method handler for contactText text field
  countcontactTextLength(String contactText) async {
    if (contactText.isEmpty) {
      contactTextWrittenLength = 0;
      contactTextCountBoxScale = 0;
    } else {
      contactTextWrittenLength = contactText.length;
      contactTextCountBoxScale = 1;
    }
    update();
    if (contactText.length == contactTextMaxLength) {
      contactTextCountBoxScale = 1.25;
      await Future.delayed(const Duration(milliseconds: 30));
      contactTextCountBoxScale = 1;
    }

    update();
  }
}
