// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';

import '../../controllers/mainController.dart';
import '../../utils/AppColors.dart';
import '../../utils/allFavoritesList.dart';
import 'widgets/favorite.dart';

class ChooseFavoritesPage extends StatelessWidget {
  ChooseFavoritesPage({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: double.infinity,
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: CustomButton(
          shouldReverseColors: true,
          text: mainController.allFirstWordLetterToUppercase("Done"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.darkBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          mainController.allFirstWordLetterToUppercase("Choose your favorites"),
          style: TextStyle(color: AppColors.darkBlack),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                AutoSizeText(
                  mainController.allFirstWordLetterToUppercase(
                      "what we should consider as priority for you ?"),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: favoritesListData.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      crossAxisCount: 2,
                      childAspectRatio: 2),
                  itemBuilder: (context, index) => FavoriteBox(
                    dataList: favoritesListData,
                    indexPass: index,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
