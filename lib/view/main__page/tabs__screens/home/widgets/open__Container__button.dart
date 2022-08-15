
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../../general__widgets/action__button.dart';

class OpenContainerButton extends StatelessWidget {
  const OpenContainerButton(
      {Key? key, required this.screenToOpen, required this.icon})
      : super(key: key);

  final Widget screenToOpen;
  final IconData icon;
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
