import 'package:flutter/material.dart';
import 'package:watch_it_later/utils/AppColors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText = "your name",
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText,
        errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        )),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        )),
      ),
    );
  }
}
