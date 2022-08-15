// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';

class DialogTextButton extends StatelessWidget {
  const DialogTextButton(
      {Key? key,
      required this.mainController,
      required this.onPressed,
      required this.text,
      required this.hasBackground})
      : super(key: key);
  
  // Variables
  final mainController;
  final String text;
  final void Function()? onPressed;
  final bool hasBackground;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              hasBackground ? AppColors.darkBlack : Colors.transparent,
          primary: hasBackground ? AppColors.lightGrey : AppColors.darkBlack,
        ),
        onPressed: onPressed,
        child: Text(
          mainController.allFirstWordLetterToUppercase(text),
          style: TextStyle(
            color: hasBackground
                ? AppColors.white
                : AppColors.darkBlack.withOpacity(.6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
