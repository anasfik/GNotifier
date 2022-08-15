// ignore_for_file: must_be_immutable

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../../general__widgets/action__button.dart';

class OpenContainerButton extends StatelessWidget {
  OpenContainerButton(
      {Key? key, required this.screenToOpen, required this.icon})
      : super(key: key);

  Widget screenToOpen;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedBuilder: (context, action) {
        return CustomActionIconButton(
          icon: icon,
        );
      },
      openBuilder: (context, action) {
        return screenToOpen;
      },
    );
  }
}
