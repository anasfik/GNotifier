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
  // set a new Username to the box
  setUserName(String textFieldValue) async {
  
  
    // Opening the other box
    Box localBox = await Hive.openBox('locals');
    
    
    // Saving the username in the box
    localBox.put("username", textFieldValue);
    
    
    // Setting the new username value (for the first time, but it's optional)
    username = textFieldValue;


    // when this is done we need to set that this is an old user so he will be redirected to mainPage
    localBox.put("isNewUsingApp", false);
  }


  // get username from the box
    String getUsername() {
    // Like we see we opened the box directly cause, it's already open from the getUsernameController
    // Getting the box
    Box localBox = Hive.box('locals');

    // Getting the username from the box
    String usernameToShow = localBox.get("username");

    ///
    // since we didn't save the username value in some variables, we will let the box open, yes, this is fine (from the official hive docs)
    // if you think that will cause performance problem, save the value we got into a variable and return it and close the box
    // localBox.close();
    ///

    // Got it
    return usernameToShow;
  }
}
