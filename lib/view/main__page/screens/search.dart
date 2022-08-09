// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
                  SizedBox(height: 30),

                  Column(
                    children: [
                      ...List.generate(
                          searchController
                              .filterList(
                                  searchController.searchBarController.text)
                              .length,
                          (index) => NotificationCard(
                                title: searchController
                                    .filterList(searchController
                                        .searchBarController
                                        .text)[searchController
                                            .filterList(searchController
                                                .searchBarController.text)
                                            .length -
                                        index -
                                        1]
                                    .title,
                                description: searchController
                                    .filterList(searchController
                                        .searchBarController
                                        .text)[searchController
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
                              )),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
