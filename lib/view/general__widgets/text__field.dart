import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.hintText,
      this.suffixIcon = null,
      this.contentPadding = const EdgeInsets.all(15)})
      : assert(hintText != null, "hintText must not be null"),
        super(key: key);

  String? hintText;
  Icon? suffixIcon;
  EdgeInsets contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        alignLabelWithHint: false,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.darkBlack.withOpacity(.05),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
