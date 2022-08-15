import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/AppColors.dart';

class OptionTitle extends StatelessWidget {
  const OptionTitle({
    Key? key,
    required this.mainController,
    required this.text,
  }) : super(key: key);

  final mainController;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      mainController.allFirstWordLetterToUppercase(text),
      style: TextStyle(
        fontSize: 18,
        color: AppColors.darkBlack,
      ),
      maxLines: 1,
    );
  }
}
