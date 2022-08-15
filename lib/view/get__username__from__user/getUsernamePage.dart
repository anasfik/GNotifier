import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/get__username__controller/get__username__controller.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';

import '../../controllers/mainController.dart';
import '../general__widgets/text__field.dart';

class GetUsernamePage extends StatelessWidget {
  GetUsernamePage({Key? key}) : super(key: key);
  // Dependency injection
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Constrain all page to the screen size
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Get.height,
            maxWidth: Get.width,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                // this should change to own logo
                const FlutterLogo(size: 120),
                const Spacer(),
                Column(
                  children: [
                    AutoSizeText(
                      mainController.allFirstWordLetterToUppercase(
                          "what we can call you ?"),
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<GetUsernameController>(
                      init: GetUsernameController(),
                      builder: (getUsernameController) {
                        return CustomTextField(
                          counterBoxScale:
                              getUsernameController.usernameCountBoxScale,
                          titleWrittenLength:
                              getUsernameController.usernameWrittenLength,
                          showCounter: true,
                          onChanged: (value) {
                            getUsernameController.countUsernameLength(value);
                          },
                          maxLength: getUsernameController.usernameMaxLength,
                          controller:
                              getUsernameController.usernameTextFieldController,
                          hintText: mainController
                              .allFirstWordLetterToUppercase("your name"),
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
                GetBuilder<GetUsernameController>(
                  builder: (getUsernameController) {
                    return CustomButton(
                      onPressed: getUsernameController
                              .usernameTextFieldController.text
                              .trim()
                              .isNotEmpty
                          ? () {
                              getUsernameController.setUserName(
                                getUsernameController
                                    .usernameTextFieldController.text
                                    .trim(),
                              );

                              Get.offAllNamed('/mainPage');
                            }
                          
                          : null,
                      shouldReverseColors: true,
                      text:
                          mainController.allFirstWordLetterToUppercase("next"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
