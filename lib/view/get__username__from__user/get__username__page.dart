import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/get__username__controller/get__username__controller.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';

import '../../controllers/main__controller.dart';
import '../../utils/AppColors.dart';
import '../general__widgets/text__field.dart';

class GetUsernamePage extends StatelessWidget {
  const GetUsernamePage({Key? key}) : super(key: key);

  // Dependency injection
  static final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                const Spacer(
                  flex: 2,
                ),
                // This should change to own logo
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/docs_assets/Logo.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    AutoSizeText(
                      mainController.allFirstWordLetterToUppercase(
                          "what we can call you ?"),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlack,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<GetUsernameController>(
                      init: GetUsernameController(),
                      builder: (getUsernameController) {
                        return CustomTextField(
                          key: const Key("get username text field"),
                          counterTextColor: AppColors.white,
                          counterBpxColor: AppColors.darkBlack,
                          textColor: AppColors.darkBlack,
                          backgroundColor: AppColors.darkBlack.withOpacity(.4),
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
                      key: const Key("get username button"),
                      isBtnColorForGetStarted: true,
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
