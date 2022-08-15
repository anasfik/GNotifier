import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import '../../utils/strict__mode__for production.dart';
import '../../view/main__page/tabs__screens/favorites.dart';
import '../../view/main__page/tabs__screens/home/home.dart';
import '../../view/main__page/tabs__screens/search.dart';
import '../../view/main__page/tabs__screens/settings.dart';
import 'home__page__tab__errors_controller.dart';

// TickerProvider help us listen to changes at 60fps or higher
class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  BottomBarController() {
    tabs = tabsIcons
        .map(
          (icon) => Tab(
            icon: Icon(icon,),
          ),
        )
        .toList();
  }
  // dependency injection
  final MainController mainController = Get.put(MainController());

  // late is for disabling the null error cause it will never be null
  late TabController tabController;

///////////////////////////////
  /// note: the number of tabIcons, tabScreens should be equal, otherwise the framework will throw error
  // and for production, no icon should not be repeated(why do you need duplicated icons in tabBar)
  // icons
  List<IconData> tabsIcons = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.settings,
  ];

  // screens
  // note: all of those are type of stateless, thanks to getx for this
  List<StatelessWidget> tabScreens = [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  //tabs to show, it's value is in the constructor block
  late List<Tab> tabs;
///////////////////////////////

  @override
  void onInit() {
    // this initialize the tabController when the app open
    tabController = TabController(vsync: this, length: tabs.length);

    super.onInit();
  }

  @override
  void onReady() {
    TabErrorsController(
      activateOnCondition: isStrictProductionMode,
      tabsIcons: tabsIcons,
      tabsScreens: tabScreens,
    ).init();

    super.onReady();
  }

  @override
  void onClose() {
    // since the screens navigation controlled with the tabs this is actually just an important sugar
    tabController.dispose();
    super.onClose();
  }
}
