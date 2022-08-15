import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../controllers/get__username__controller/get__username__controller.dart';

class UsernameWelcome extends StatelessWidget {
  UsernameWelcome({
    Key? key,
    required this.mainController,
    required this.getUsernameController,
    required this.textToShowBeforeUsername,
  }) : super(key: key);

  final mainController;
  final GetUsernameController getUsernameController;
  String textToShowBeforeUsername;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        text: mainController
            .allFirstWordLetterToUppercase(textToShowBeforeUsername),
        children: [
          TextSpan(
            text: mainController.allFirstWordLetterToUppercase(
              getUsernameController.getUsername(),
            ),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }
}
