import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/newItemNotificationModel.dart';

class MainMethodsService {
  Future<void> init() async {
    //
    WidgetsFlutterBinding.ensureInitialized();

    /// init hive
    await Hive.initFlutter();

    // register model generated with hive generator to open in when the get username page is opened
    Hive.registerAdapter<NewItemNotifcationModel>(
        NewItemNotifcationModelAdapter());

    // opening notifications box

    await Hive.openBox<NewItemNotifcationModel>("newNotificationsBox");

    // open the locals box because we need it now
    await Hive.openBox("locals");

    // this should be uncommented while debugging, so every time the app opened it will clear the box, in production delete it so the app will only show the notifications that are saved in the box
    // await localBox.clear();
    // await newNotifications.clear();
  }
}
