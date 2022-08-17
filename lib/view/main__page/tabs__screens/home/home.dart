import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/controllers/notifications__controllers/new__item__notification__controller.dart';
import 'package:watch_it_later/view/general__widgets/nothing__to__show__text.dart';
import 'package:watch_it_later/view/main__page/tabs__screens/home/widgets/open__Container__button.dart';
import '../../../../controllers/get__username__controller/get__username__controller.dart';
import '../../../../controllers/main__controller.dart';
import '../../../../model/newItemNotificationModel.dart';
import '../../../general__widgets/notification__card.dart';
import '../../../add_new_item/add__new__item.dart';
import '../../../general__widgets/screen__title.dart';
import 'widgets/username__welcome.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // Dependency injection
  final MainController mainController = Get.put(MainController());
  final NewNotificationController newNotificationController =
      Get.put(NewNotificationController());
  final GetUsernameController getUsernameController =
      Get.put(GetUsernameController());

  //
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
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
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

            // Username welcome
            UsernameWelcome(
              textToShowBeforeUsername: "hey, ",
              mainController: mainController,
              getUsernameController: getUsernameController,
            ),

            const Divider(),
            const SizedBox(height: 20),

            //
            ScreenTitle(
              mainController: mainController,
              title: "latest added notification",
            ),

            const SizedBox(height: 20),
            // Items list
            ValueListenableBuilder(
                valueListenable:
                    Hive.box<NewItemNotifcationModel>("newNotificationsBox")
                        .listenable(),
                builder: (BuildContext context,
                    Box<NewItemNotifcationModel> box, __) {
                  if (box.values.isEmpty) {
                    return NothingToShow(
                      text:
                          "press ' + ' to create your first schedule notification",
                      mainController: mainController,
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
