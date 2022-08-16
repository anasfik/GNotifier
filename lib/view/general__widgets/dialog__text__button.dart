// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';

class DialogTextButton extends StatelessWidget {
  const DialogTextButton({
    Key? key,
    required this.mainController,
    required this.onPressed,
    required this.text,
    required this.hasBackground,
    this.forDelete = false,
  }) : super(key: key);

  // Variables
  final mainController;
  final String text;
  final void Function()? onPressed;
  final bool hasBackground, forDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: hasBackground
              ? forDelete
                  ? Colors.red.withOpacity(.15)
                  : Theme.of(context).primaryColor
              : Colors.transparent,
          primary: hasBackground
              ? forDelete
                  ? Colors.red
                  : AppColors.lightGrey
              : Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          mainController.allFirstWordLetterToUppercase(text),
          style: TextStyle(
            color: hasBackground
                ? forDelete
                    ? Colors.red
                    : AppColors.white
                : Theme.of(context).primaryColor.withOpacity(.6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
