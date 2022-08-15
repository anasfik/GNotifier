import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class GetUsernameController extends GetxController {

  // Text editing controller
  final TextEditingController usernameTextFieldController =
      TextEditingController();

  // Username variables
  String username = "anonymous user";
  int usernameMaxLength = 15;
  int usernameWrittenLength = 0;
  double usernameCountBoxScale = 0;

  // Method handler for username text field
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
      usernameCountBoxScale = 1.25;
      await Future.delayed(const Duration(milliseconds: 30));
      usernameCountBoxScale = 1;
    }

    update();
  }

  saveUsernameInBox(String textFieldValue) async {
    // Opening the other box
    
    
    Box localBox = await Hive.openBox('locals');
    
    
    // Saving the username in the box
    localBox.put("username", textFieldValue);
    
    
    // Setting the new username value (for the first time, but it's optional)
    username = textFieldValue;


    // when this is done we need to set that this is an old user so he will be redirected to mainPage
    localBox.put("isNewUsingApp", false);
  }
}
