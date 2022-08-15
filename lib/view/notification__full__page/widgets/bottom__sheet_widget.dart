// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/main__controller.dart';

import '../../../controllers/notifications__controllers/new__item__notification__controller.dart';
import '../../../model/newItemNotificationModel.dart';
import '../../../utils/AppColors.dart';
import '../../general__widgets/action__button.dart';
import '../../general__widgets/text__field.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    Key? key,
    required this.hint,
    this.forDescription = false,
    this.forTitle = false,
    required this.gettedNotification,
    required this.onSuccess,
  })  : assert(forDescription ^ forTitle,
            "you should specify for what this bottomsheet should be, forDescription or forTitle"),
        super(key: key);
  final MainController mainController = Get.put(MainController());
  String hint;
  void Function() onSuccess;
  NewItemNotifcationModel gettedNotification;
  bool forTitle, forDescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      color: AppColors.lightGrey,
      child: GetBuilder<NewNotificationController>(
        init: NewNotificationController(),
        builder: (newNotificationController) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (forTitle) ...[
              GetBuilder<NewNotificationController>(
                init: NewNotificationController(),
                builder: (newNotificationController) {
                  return CustomTextField(
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
            ],
            if (forDescription) ...[
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
                    controller: newNotificationController.descriptionController,
                    hintText: mainController
                        .allFirstWordLetterToUppercase("description"),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                  );
                },
              ),
            ],
            SizedBox(
              height: 20,
            ),
            Container(
              // this is for that the counter box will be aligned with success button
              // margin: EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<NewNotificationController>(
                    init: NewNotificationController(),
                    builder: (newNotificationController) {
                      return GestureDetector(
                        onTap: () {
                          if (forTitle) {
                            newNotificationController.titleController.text = "";
                            newNotificationController.countTitleLength("");
                            newNotificationController.titleWrittenLength = 0;
                          }

                          if (forDescription) {
                            newNotificationController
                                .descriptionController.text = "";
                            newNotificationController
                                .countDescriptionLength("");
                            newNotificationController.descriptionWrittenLength =
                                0;
                          }
                        },
                        child: CustomActionIconButton(
                            icon: Icons.restart_alt,
                            shouldReverseColors: false),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: onSuccess,
                    child: CustomActionIconButton(
                        icon: Icons.done, shouldReverseColors: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
