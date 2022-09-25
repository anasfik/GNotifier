import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../helpers__controllers/dialogs__controller.dart';

class ContactController extends GetxController {
  //
  final DialogsController dialogsController = Get.find();
  late String _username;
  late TextEditingController textAreaEditingController;

  // Contact text area text variables
  int contactTextMaxLength = 250;
  int contactTextWrittenLength = 0;
  double contactTextCountBoxScale = 0;

  @override
  void onInit() {
    // Init the variables
    textAreaEditingController = TextEditingController();

    _username = Hive.box("locals").get("username");
    super.onInit();
  }

  @override
  void onClose() {
    textAreaEditingController.dispose();
    super.onClose();
  }

  String get username => _username;
}
