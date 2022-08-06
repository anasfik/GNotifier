// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/mainController.dart';

class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // variables
  late TabController tabController;
  static MainController mainController = Get.put(MainController());
  //tabs to show
  List<Tab> tabs = <Tab>[
    Tab(
      icon: Icon(Icons.home),
    ),
    Tab(
      icon: Icon(Icons.search),
    ),
    Tab(
      icon: Icon(Icons.favorite),
    ),
    Tab(
      icon: Icon(Icons.settings),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
