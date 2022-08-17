import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/add_new_item/widgets/description.dart';
import 'package:watch_it_later/view/add_new_item/widgets/option.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/general__widgets/text__field.dart';
import '../../controllers/helpers__controllers/TextEditingsClearController.dart';
import '../../controllers/notifications__controllers/date__Controller.dart';
import '../../controllers/notifications__controllers/new__item__notification__controller.dart';
import '../general__widgets/action__button.dart';
import 'widgets/new__title.dart';

class AddNewItemScreen extends StatelessWidget {
  AddNewItemScreen({Key? key}) : super(key: key);

  // Dependencies injection
  final MainController mainController = Get.put(MainController());
  final DateController dateController = Get.put(DateController());
  final NewNotificationController newNotificationController =
      Get.put(NewNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      // The column should be scrollable so :
      body: SingleChildScrollView(
        // But in this case it will be scrollable to infinity, so we need to set constraints so:
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: CustomActionIconButton(
                          shouldReverseColors: true,
                          icon: Icons.close,
                        ),
                      ),
                    ),
                  ],
                ),
                NewTitle(
                  mainController: mainController,
                  text: 'new',
                ),
                const SizedBox(
                  height: 10,
                ),
                Description(
                  text:
                      "write the title and description of your notification and set a schedule",
                  mainController: mainController,
                ),
                const Spacer(),
                //one init of controller is enough

                GetBuilder<NewNotificationController>(
                  init: NewNotificationController(),
                  builder: (newNotificationController) {
                    return CustomTextField(
                      counterTextColor: Theme.of(context).backgroundColor,
                      counterBpxColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(.2),
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
                      counterBpxColor: Theme.of(context).primaryColor,
                      counterTextColor: Theme.of(context).backgroundColor,
                      textColor: Theme.of(context).primaryColor,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(.2),
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 15),
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
                              var gettedDate =
                                  await dateController.getFullDateFromUser();
                              dateController.setFullDate(gettedDate);
                            },
                            child: Option(
                              mainController: mainController,
                              text: "date",
                              icon: Icons.calendar_month_outlined,
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
                              child: Option(
                                mainController: mainController,
                                text: "repeat",
                                icon: Icons.repeat,
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
                                  newNotificationController.hasAutoDeleteEnabled
                                      ? 1
                                      : .55,
                              child: Option(
                                mainController: mainController,
                                text: "auto delete",
                                icon: Icons.auto_delete,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: () {
                      newNotificationController.addNewNotification(
                        newNotificationController.titleController.text.trim(),
                        newNotificationController.descriptionController.text
                            .trim(),
                        dateController.date,
                        newNotificationController.isRepeatedOptionEnabled,
                        newNotificationController.hasAutoDeleteEnabled,
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
