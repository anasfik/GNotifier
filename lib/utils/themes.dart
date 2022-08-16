import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_it_later/utils/AppColors.dart';

class AppThemes {
  AppThemes({required this.context}) {
    lightMode = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Colors.deepPurple,
      ),
      primaryColor: Colors.deepPurple,
      backgroundColor: AppColors.white,
      hintColor: Colors.deepPurple,
      textTheme: GoogleFonts.nunitoTextTheme(
        Theme.of(context).textTheme.copyWith(
              bodyText2: const TextStyle(color: Colors.deepPurple),
            ),
      ),
      primaryIconTheme: const IconThemeData(
        color: Colors.deepPurple,
      ),
      iconTheme: const IconThemeData(
        color: Colors.deepPurple,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.deepPurple,
        selectionColor: Colors.deepPurple.withOpacity(.5),
        selectionHandleColor: Colors.deepPurple,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    darkMode = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Colors.deepPurple,
      ),
      primaryColor: Colors.deepPurple,
      backgroundColor: AppColors.white,
      hintColor: Colors.deepPurple,
      textTheme: GoogleFonts.nunitoTextTheme(
        Theme.of(context).textTheme.copyWith(
              bodyText2: const TextStyle(color: Colors.deepPurple),
            ),
      ),
      primaryIconTheme: const IconThemeData(
        color: Colors.deepPurple,
      ),
      iconTheme: const IconThemeData(
        color: Colors.deepPurple,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.deepPurple,
        selectionColor: Colors.deepPurple.withOpacity(.5),
        selectionHandleColor: Colors.deepPurple,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  late BuildContext context;

  late ThemeData lightMode;
  late ThemeData darkMode;
}
