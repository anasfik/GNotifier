import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers__controllers/dialogs__controller.dart';

class ContactController extends GetxController {
  final DialogsController dialogsController = Get.put(DialogsController());
  @override
  void onInit() {
    // Init the variables
    textAreaEditingController = TextEditingController();
    username = localBox.get("username");
    super.onInit();
  }

  @override
  void onClose() {
    textAreaEditingController.dispose();
    super.onClose();
  }

  // Variables
  late String username;
  Box localBox = Hive.box("locals");

  // text area controller
  late TextEditingController textAreaEditingController;

  // Contact text area text variables
  int contactTextMaxLength = 250;
  int contactTextWrittenLength = 0;
  double contactTextCountBoxScale = 0;

// Send mailto method
  Future<void> sendMailto() async {
    const String developerEmail = "fffikhi.aanas@gmail.com";
    final String emailSubject = "$username Contacted you from GNotifier app";
    final Uri parsedMailto = Uri.parse(
        "mailto:<$developerEmail>?subject=$emailSubject&body=${textAreaEditingController.text}");

    if (!await launchUrl(
      parsedMailto,
      mode: LaunchMode.externalApplication,
    )) {
      dialogsController
          .showSnackbar("those changes will be applied after app restart");
    }
  }

  // count method
  // Method handler for contactText text field
  countContactTextLength(String contactText) async {
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
