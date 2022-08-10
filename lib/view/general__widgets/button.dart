import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/AppColors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = "Go",
    this.shouldReverseColors = false,
    this.onPressed,
  }) : super(key: key);
  final bool shouldReverseColors;
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // like overflow: hidden
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: shouldReverseColors ? AppColors.darkBlack : AppColors.white,
          onPrimary:
              shouldReverseColors ? AppColors.white : AppColors.darkBlack,
        ),
        child: AutoSizeText(
          text,
          style: TextStyle(
            color: shouldReverseColors ? AppColors.white : AppColors.darkBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
