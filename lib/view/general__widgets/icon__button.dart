import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/controllers/helpersControllers/dialogsController.dart';

import '../../controllers/favorites__controller.dart/favorites__controller.dart';
import '../../model/newItemNotificationModel.dart';
import '../../utils/AppColors.dart';

class FavoriteIconButton extends StatelessWidget {
  FavoriteIconButton({
    Key? key,
    required this.isChecked,
    required this.passedIndex,
  }) : super(key: key);
  bool isChecked;
  void Function()? onPressed;
  int passedIndex;
  FavoritesController favoritesController = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        // hide ink effect
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: GetBuilder<FavoritesController>(
          init: FavoritesController(),
          builder: (favoritesController) {
            return IconButton(
              onPressed: () {
                isChecked = !isChecked;

                Get.find<FavoritesController>().addToFavorites(passedIndex);
                favoritesController.update();
              },
              icon: Icon(
                isChecked ? Icons.favorite : Icons.favorite_outline,
                color: AppColors.darkBlack.withOpacity(.7),
              ),
            );
          }),
    );
  }
}
