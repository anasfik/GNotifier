// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_point_tab_bar/pointTabBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home__page__tab__controller.dart/home__page__tab__controller.dart.dart';
import '../../utils/AppColors.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final BottomBarController bottomBarController =
      Get.put(BottomBarController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        // appBar: AppBar(
        //   title: Text(mainController.allFirstWordLetterToUppercase("home page")),
        //   toolbarHeight: 80,
        //   backgroundColor: AppColors.darkBlack,
        // ),
        bottomNavigationBar: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: BottomAppBar(
            color: AppColors.darkBlack,
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: TabBar(
                indicator: PointTabIndicator(
                  position: PointTabIndicatorPosition.bottom,
                  color: Colors.white,
                  insets: EdgeInsets.only(bottom: 10),
                ),
                labelStyle: TextStyle(fontSize: 12),
                controller: bottomBarController.tabController,
                tabs: bottomBarController.tabs,
                unselectedLabelColor: AppColors.white.withOpacity(.6),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: bottomBarController.tabController,
          children: [
            ...List.generate(
              bottomBarController.tabScreens.length,
              (index) => bottomBarController.tabScreens[index],
            )
          ],
        ),
      ),
    );
  }
}
