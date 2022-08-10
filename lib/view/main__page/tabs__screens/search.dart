// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:watch_it_later/view/general__widgets/notification__card.dart';

import '../../../controllers/mainController.dart';
import '../../../controllers/search__controller/search__controller.dart';
import '../../../model/newItemNotificationModel.dart';
import '../../../utils/AppColors.dart';
import '../../general__widgets/icon__button.dart';
import '../../general__widgets/text__field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
  final searchController = Get.lazyPut(() => SearchController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20),
      child: GetBuilder<SearchController>(
          init: SearchController(),
          builder: (searchController) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  SizedBox(height: 20),
                  AutoSizeText(
                    mainController
                        .allFirstWordLetterToUppercase("search by title"),
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //
                  SizedBox(height: 30),

                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: CustomTextField(
                      maxLength: 50,
                      onChanged: (value) {
                        print(searchController.filterList(value));
                      },
                      controller: searchController.searchBarController,
                      hintText: mainController
                          .allFirstWordLetterToUppercase("search"),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  //
                  if (searchController.searchBarController.text.isEmpty) ...[
                    SizedBox(height: 100),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 40, left: 20),
                        child: AutoSizeText(
                            mainController.allFirstWordLetterToUppercase(
                                "search for anything of your notifications"),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkBlack.withOpacity(.6)),
                            maxLines: 2,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],

                  if (searchController.searchBarController.text.isNotEmpty &&
                      searchController
                          .filterList(searchController.searchBarController.text)
                          .isEmpty) ...[
                    SizedBox(height: 100),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Lottie.asset(
                                "assets/lottie/not_found.json",
                                width: 120,
                              ),
                            ),
                            AutoSizeText(
                                mainController.allFirstWordLetterToUppercase(
                                    "no items found"),
                                style: TextStyle(
                                  color: AppColors.darkBlack.withOpacity(.6),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (searchController.searchBarController.text.isNotEmpty &&
                      searchController
                          .filterList(searchController.searchBarController.text)
                          .isNotEmpty) ...[
                    Column(
                      children: [
                        SizedBox(height: 30),
                        ...List.generate(
                            searchController
                                .filterList(
                                    searchController.searchBarController.text)
                                .length, (index) {
                          return NotificationCard(
                            title: searchController
                                .filterList(searchController
                                    .searchBarController.text)[searchController
                                        .filterList(searchController
                                            .searchBarController.text)
                                        .length -
                                    index -
                                    1]
                                .title,
                            description: searchController
                                .filterList(searchController
                                    .searchBarController.text)[searchController
                                        .filterList(searchController
                                            .searchBarController.text)
                                        .length -
                                    index -
                                    1]
                                .description,
                            isFavoriteButtonHidden: true,
                            reversedIndex: searchController
                                    .filterList(searchController
                                        .searchBarController.text)
                                    .length -
                                index -
                                1,
                          );
                        }),
                      ],
                    ),
                  ],
                ],
              ),
            );
          }),
    );
  }
}