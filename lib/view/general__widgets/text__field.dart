import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.suffixIcon,
      required this.maxLength,
      this.onChanged,
      this.titleWrittenLength,
      this.animationDuration = const Duration(milliseconds: 50),
      this.counterBoxScale,
      this.showCounter = false,
      this.contentPadding = const EdgeInsets.all(15)})
      : assert(hintText != null, "hintText must not be null"),
        super(key: key);

  void Function(String)? onChanged;
  String? hintText;
  Icon? suffixIcon;
  bool showCounter;
  EdgeInsets contentPadding;
  TextEditingController? controller;
  int? maxLength, titleWrittenLength;
  double? counterBoxScale;
  Duration animationDuration;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Visibility(
          visible: showCounter,
          child: Positioned(
            bottom: -5,
            right: 10,
            child: AnimatedScale(
              duration: animationDuration,
              scale: counterBoxScale ?? 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "$titleWrittenLength / $maxLength",
                  style: TextStyle(color: AppColors.lightGrey, fontSize: 10),
                ),
              ),
            ),
          ),
        ),
        TextField(
          maxLength: maxLength,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            counterText: "",
            // shrink the default counter
            counter: const SizedBox.shrink(),
            alignLabelWithHint: false,
            contentPadding: contentPadding,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Theme.of(context).primaryColor.withOpacity(.05),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
