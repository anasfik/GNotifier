import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/AppColors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = "Go",
    this.shouldReverseColors = false,
    this.onPressed,
    this.radiusValue = 20,
    this.isDelete = false,
  }) : super(key: key);

  final bool shouldReverseColors, isDelete;
  final void Function()? onPressed;
  final String text;
  final double radiusValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // like overflow: hidden
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusValue),
      ),
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: shouldReverseColors
              ? AppColors.darkBlack
              : isDelete
                  ? Color.fromARGB(255, 255, 190, 184)
                  : AppColors.lightGrey,
          onPrimary:
              shouldReverseColors ? AppColors.white : AppColors.darkBlack,
        ),
        child: AutoSizeText(
          text,
          style: TextStyle(
            color: shouldReverseColors
                ? AppColors.white
                : isDelete
                    ? Colors.red
                    : AppColors.darkBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
