
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/mainController.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/general__widgets/text__field.dart';
import '../../controllers/notificationsControllers/date__Controller.dart';
import '../../controllers/notificationsControllers/newItemNotificationController.dart';
import '../general__widgets/action__button.dart';

class AddNewItemScreen extends StatelessWidget {
  AddNewItemScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
  final DateController dateController = Get.put(DateController());
  final NewNotificationController newNotificationController =
      Get.put(NewNotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      // the column should be scrollable so :
      body: SingleChildScrollView(
        // but in this case it will be scrollable to infinity, so we need to set constraints so:
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomActionIconButton(
                      shouldReverseColors: true,
                      icon: Icons.close,
                    ),
                  ),
                ),
                AutoSizeText(
                  mainController.allFirstWordLetterToUppercase("new"),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBlack,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  mainController.allFirstWordLetterToUppercase(
                      "write the title and description of your notification and set a schedule"),
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.darkBlack.withOpacity(.55),
                  ),
                  maxLines: 3,
                ),
                const Spacer(),
                //one init of controller is enough

                GetBuilder<NewNotificationController>(
                  init: NewNotificationController(),
                  builder: (newNotificationController) {
                    return CustomTextField(
                      key: newNotificationController.titleTextFieldKey,
                      showCounter: true,
                      counterBoxScale:
                          newNotificationController.titleCountBoxScale,
                      titleWrittenLength:
                          newNotificationController.titleWrittenLength,
                      onChanged: (value) {
                        newNotificationController.countTitleLength(value);
                      },
                      maxLength: newNotificationController.titleMaxLength,
                      controller: newNotificationController.titleController,
                      hintText:
                          mainController.allFirstWordLetterToUppercase("title"),
                    );
                  },
                ),
                const SizedBox(height: 20),
                GetBuilder<NewNotificationController>(
                  builder: (newNotificationController) {
                    return CustomTextField(
                      key: newNotificationController.descriptionTextFieldKey,
                      showCounter: true,
                      counterBoxScale:
                          newNotificationController.descriptionCountBoxScale,
                      titleWrittenLength:
                          newNotificationController.descriptionWrittenLength,
                      onChanged: (value) {
                        newNotificationController.countDescriptionLength(value);
                      },
                      maxLength: newNotificationController.descriptionMaxLength,
                      controller:
                          newNotificationController.descriptionController,
                      hintText: mainController
                          .allFirstWordLetterToUppercase("description"),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    );
                  },
                ),
                const Spacer(),
                GetBuilder<NewNotificationController>(
                    builder: (newNotificationController) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            dateController.setFullDate(
                                await dateController.getFullDateFromUser());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                size: 35,
                              ),
                              AutoSizeText(
                                mainController
                                    .allFirstWordLetterToUppercase("date"),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.darkBlack,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            newNotificationController
                                .toggleRepeatedOptionBoolean();

                            // print(
                            //     "${newNotificationController.isRepeatedOptionEnabled}, ${newNotificationController.isAlarmOptionEnabled}");
                          },
                          child: Opacity(
                            opacity: newNotificationController
                                    .isRepeatedOptionEnabled
                                ? 1
                                : .55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.repeat,
                                  size: 35,
                                ),
                                AutoSizeText(
                                  mainController.allFirstWordLetterToUppercase(
                                      "repeated"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.darkBlack,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            newNotificationController
                                .toggleAlarmOptionBoolean();
                          },
                          child: Opacity(
                            opacity:
                                newNotificationController.isAlarmOptionEnabled
                                    ? 1
                                    : .55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.alarm,
                                  size: 35,
                                ),
                                AutoSizeText(
                                  mainController
                                      .allFirstWordLetterToUppercase("alarm"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.darkBlack,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: () {
                      newNotificationController.addNewNotification(
                        newNotificationController.titleController.text.trim(),
                        newNotificationController.descriptionController.text
                            .trim(),
                        dateController.date as DateTime,
                        newNotificationController.isRepeatedOptionEnabled,
                        newNotificationController.isAlarmOptionEnabled,
                      );
                    },
                    text:
                        mainController.allFirstWordLetterToUppercase("create"),
                    shouldReverseColors: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
