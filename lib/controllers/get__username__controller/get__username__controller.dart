import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUsernameController extends GetxController {
  // Text editing controller
  final TextEditingController usernameTextFieldController =
      TextEditingController();

  // Username variables
  int usernameMaxLength = 15;
  int usernameWrittenLength = 0;
  double usernameCountBoxScale = 0;

  // method handler for username text field
  countUsernameLength(String username) async {
    if (username.isEmpty) {
      usernameWrittenLength = 0;
      usernameCountBoxScale = 0;
    } else {
      usernameWrittenLength = username.length;
      usernameCountBoxScale = 1;
    }
    update();
    if (username.length == usernameMaxLength) {
      usernameCountBoxScale = 1.5;
      await Future.delayed(const Duration(milliseconds: 30));
      usernameCountBoxScale = 1;
    }

    update();
  }

  saveUsernameInBox() {
    
  }
}
