import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/favorites__controller.dart/favorites__controller.dart';

class FavoriteIconButton extends StatelessWidget {
  FavoriteIconButton({
    Key? key,
    required this.isChecked,
    required this.passedIndex,
    this.size = 26,
  }) : super(key: key);
  bool isChecked;
  double size;
  final int passedIndex;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
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
          return AnimatedBuilder(
              animation: favoritesController.scale,
              builder: (context, __) {
                return Transform.scale(
                  scale: favoritesController.scale.value,
                  child: IconButton(
                    onPressed: () {
                      isChecked = !isChecked;

                      favoritesController.addToFavorites(passedIndex);

                      favoritesController.animate(isChecked);
                      favoritesController.update();
                    },
                    icon: Icon(
                      isChecked ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.red[800],
                      size: size,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
