import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/AppColors.dart';

class NewTitle extends StatelessWidget {
  const NewTitle({
    Key? key,
    required this.mainController,
    required this.text,
  }) : super(key: key);
  final String text;
  final mainController;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      mainController.allFirstWordLetterToUppercase(text),
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
