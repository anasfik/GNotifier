import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/helpers__controllers/theme__controller.dart';
import '../../../../controllers/main__controller.dart';
import 'widgets/setting__card.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            AutoSizeText(
              mainController.allFirstWordLetterToUppercase("settings"),
              maxLines: 2,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            //

            //
            const SizedBox(height: 20),

            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              children: [
                GetBuilder<ThemeController>(
                  init: ThemeController(),
                  builder: (themeController) {
                    return SettingCard(
                      icon: Icons.brightness_2,
                      mainController: mainController,
                      description: "Switch app theme to dark / light mode",
                      title: "dark mode",
                      onTap: () {
                        themeController.toggleDarkMode();
                      },
                    );
                  },
                ),
                SettingCard(
                  icon: Icons.color_lens,
                  mainController: mainController,
                  description: "change your app theme",
                  title: "themes",
                  onTap: () {},
                ),
                SettingCard(
                  icon: Icons.screen_lock_portrait,
                  mainController: mainController,
                  description: "show notifications in the lock screen",
                  title: "screen lock",
                  onTap: () {},
                ),
                SettingCard(
                  icon: Icons.access_time_filled,
                  mainController: mainController,
                  description: "show when the notification has been received",
                  title: "show date",
                  onTap: () {},
                ),
                SettingCard(
                  icon: Icons.delete,
                  mainController: mainController,
                  description: "this will delete all you notifications at once",
                  title: "Delete all",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
