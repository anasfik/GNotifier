import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';

class CustomActionIconButton extends StatelessWidget {
  CustomActionIconButton({
    Key? key,
    required this.icon,
    this.shouldReverseColors = false,
  }) : super(key: key);
  IconData icon;
  bool shouldReverseColors;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: shouldReverseColors ? AppColors.darkBlack : AppColors.lightGrey,
      ),
      padding: const EdgeInsets.all(15),
      child: Icon(icon,
          color:
              shouldReverseColors ? AppColors.lightGrey : AppColors.darkBlack),
    );
  }
}
