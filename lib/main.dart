// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/utils/AppTexts.dart';

import 'view/choose_priority_favorites/choose__priority__favorites__page.dart';
import 'view/get__started/get__started__page.dart';
import 'view/get__username__from__user/getUsernamePage.dart';
import 'view/main__page/main__page.dart';

void main() {
  runApp(WatchItLaterApp());
}

class WatchItLaterApp extends StatelessWidget {
  const WatchItLaterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTexts.mainTitle,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: AppColors.materialDarkBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
