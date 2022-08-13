import 'package:flutter/material.dart';

class EditIconButton extends StatelessWidget {
  EditIconButton({Key? key, this.onTap}) : super(key: key);
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Icon(Icons.edit));
  }
}
