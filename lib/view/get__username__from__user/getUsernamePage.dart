// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';

import '../../controllers/get__username__controller/get__Username__controller.dart';
import '../../controllers/mainController.dart';
import 'widgets/custom__text__field.dart';

class GetUsernamePage extends StatelessWidget {
  GetUsernamePage({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
  final GetUsernameController getUsernameInputController =
      Get.put(GetUsernameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            FlutterLogo(size: 120),
            Spacer(),
            Column(
              children: [
                AutoSizeText(
                  mainController
                      .allFirstWordLetterToUppercase("what we can call you ?"),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller:
                      getUsernameInputController.usernameTextFieldController,
                  hintText:
                      mainController.allFirstWordLetterToUppercase("your name"),
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            CustomButton(
              shouldReverseColors: true,
              text: mainController.allFirstWordLetterToUppercase("next"),
            )
          ],
        ),
      ),
    );
  }
}
