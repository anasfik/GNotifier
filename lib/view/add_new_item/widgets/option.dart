import 'package:flutter/material.dart';
import 'package:watch_it_later/controllers/mainController.dart';

import 'options__title.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.mainController,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final mainController;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 35,
        ),
        OptionTitle(
          mainController: mainController,
          text: text,
        )
      ],
    );
  }
}
