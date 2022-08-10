import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:watch_it_later/view/general__widgets/notification__card.dart';
import '../../../controllers/mainController.dart';
import '../../../controllers/search__controller/search__controller.dart';
import '../../../utils/AppColors.dart';
import '../../general__widgets/text__field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
  final searchController = Get.lazyPut(() => SearchController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20),
      child: GetBuilder<SearchController>(
          init: SearchController(),
          builder: (searchController) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  const SizedBox(height: 20),
                  AutoSizeText(
                    mainController
                        .allFirstWordLetterToUppercase("search by title"),
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //
                  const SizedBox(height: 30),

                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: CustomTextField(
                      maxLength: 50,
                      onChanged: (value) {
                        searchController.filterList(value);
                      },
                      controller: searchController.searchBarController,
                      hintText: mainController
                          .allFirstWordLetterToUppercase("search"),
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                  //
                  if (searchController.searchBarController.text.isEmpty) ...[
                    const SizedBox(height: 100),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(right: 40, left: 20),
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
                    const SizedBox(height: 100),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
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
                        const SizedBox(height: 30),
                        ...List.generate(
                          searchController
                              .filterList(
                                  searchController.searchBarController.text)
                              .length,
                          (index) {
                            List filteredList = searchController.filterList(
                                searchController.searchBarController.text);
                            int reversedIndex = filteredList.length - index - 1;
                            return NotificationCard(
                              title: filteredList[reversedIndex].title,
                              description:
                                  filteredList[reversedIndex].description,
                              isFavoriteButtonHidden: true,
                              reversedIndex: reversedIndex,
                            );
                          },
                        ),
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
