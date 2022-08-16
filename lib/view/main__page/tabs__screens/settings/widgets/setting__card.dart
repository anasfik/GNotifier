import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/AppColors.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    Key? key,
    required this.mainController,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  final mainController;
  final IconData icon;
  final String title, description;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(
                icon,
                color: Theme.of(context).primaryColor.withOpacity(.45),
                size: 35,
              ),
              const Spacer(),
              AutoSizeText(
                mainController.allFirstWordLetterToUppercase(title),
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AutoSizeText(
                  mainController.allFirstWordLetterToUppercase(description),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
