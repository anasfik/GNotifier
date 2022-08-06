// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:watch_it_later/utils/AppColors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    this.hintText = "your name",
  }) : super(key: key);

  String hintText;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText,
        errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.darkBlack,
          width: 2,
        )),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.darkBlack,
          width: 2,
        )),
      ),
    );
  }
}
