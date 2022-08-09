import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../model/newItemNotificationModel.dart';
import '../../utils/AppColors.dart';
import 'icon__button.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({
    Key? key,
    this.currentNotification,
    required this.reversedIndex,
    required this.title,
    required this.description,
    this.isFavoriteButtonHidden = false,
  }) : super(key: key);

  NewItemNotifcationModel? currentNotification;
  int reversedIndex;

  String title, description;
  bool isFavoriteButtonHidden;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      height: 120,
      child: Row(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3.5, color: AppColors.darkBlack),
            ),
          ),
          Container(
            width: 7,
            height: 2,
            color: AppColors.darkBlack,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlack.withOpacity(.03),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      AutoSizeText(
                        title,
                        style: TextStyle(
                          color: AppColors.darkBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        maxFontSize: 20,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        description,
                        style: TextStyle(
                            color: AppColors.darkBlack.withOpacity(.6),
                            fontSize: 15),
                        maxFontSize: 15,
                        maxLines: 2,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Opacity(
                    opacity: isFavoriteButtonHidden ? 0 : 1,
                    child: FavoriteIconButton(
                      isChecked: currentNotification?.isFavorite ?? false,
                      passedIndex: reversedIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 7 * 2,
            height: 2,
            color: AppColors.darkBlack,
          ),
        ],
      ),
    );
  }
}
