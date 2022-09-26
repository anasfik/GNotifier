import 'package:flutter/material.dart';
import 'package:watch_it_later/controllers/home__page__tab__controller/home__page__tab__controller.dart.dart';

extension GotoSearchTabScreenExtension on BottomBarController {
  /// Go to the search tab screen
   void gotoSearchScreen() {
    tabController.animateTo(
      tabsIcons.indexWhere(
        (tab) => tab["icon"] == Icons.search,
      ),
    );
  }
}