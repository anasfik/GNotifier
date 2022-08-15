import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/controllers/notificationsControllers/newItemNotificationController.dart';
import 'package:watch_it_later/view/main__page/tabs__screens/home/widgets/open__Container__button.dart';
import '../../../../controllers/get__username__controller/get__username__controller.dart';
import '../../../../controllers/mainController.dart';
import '../../../../model/newItemNotificationModel.dart';
import '../../../../utils/AppColors.dart';
import '../../../general__widgets/action__button.dart';
import '../../../general__widgets/notification__card.dart';
import '../../../add_new_item/add__new__item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // Dependency injection
  final MainController mainController = Get.put(MainController());
  final NewNotificationController newNotificationController =
      Get.put(NewNotificationController());
  final GetUsernameController getUsernameController =
      Get.put(GetUsernameController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),

                  // Add button
                  OpenContainerButton(
                    screenToOpen: AddNewItemScreen(),
                    icon: Icons.add,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            AutoSizeText.rich(
              TextSpan(
                text: mainController.allFirstWordLetterToUppercase("Hey, "),
                children: [
                  TextSpan(
                    text: mainController.allFirstWordLetterToUppercase(
                        getUsernameController.getUsername()),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            Visibility(
              // hide when there is nothing to show
              visible: Hive.box<NewItemNotifcationModel>("newNotificationsBox")
                  .values
                  .toList()
                  .isNotEmpty,
              child: AutoSizeText(
                mainController
                    .allFirstWordLetterToUppercase("latest added notification"),
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
            const SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable:
                    Hive.box<NewItemNotifcationModel>("newNotificationsBox")
                        .listenable(),
                builder: (BuildContext context,
                    Box<NewItemNotifcationModel> box, __) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20, top: 150),
                        child: AutoSizeText(
                          mainController.allFirstWordLetterToUppercase(
                              "no items added yet"),
                          style: TextStyle(
                            color: AppColors.darkBlack.withOpacity(.3),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      ...List.generate(
                        box.values.length,
                        (index) {
                          // making the read of the iterable start from the end
                          // ...length -1 get us to last element, since index start from 0, this will work as we want
                          int reversedIndex = box.values.length - 1 - index;
                          NewItemNotifcationModel? currentNotification =
                              box.getAt(reversedIndex);

                          return NotificationCard(
                            showDeleteButtonOnFullPage: true,
                            currentNotification: currentNotification,
                            reversedIndex: reversedIndex,
                            title: currentNotification!.title,
                            description: currentNotification.description,
                          );
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
