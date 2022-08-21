import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';
import 'package:watch_it_later/view/general__widgets/nothing__to__show__text.dart';
import 'package:watch_it_later/view/general__widgets/notification__card.dart';
import 'package:watch_it_later/view/general__widgets/screen__title.dart';
import '../../../controllers/main__controller.dart';
import '../../../controllers/search__controller/search__controller.dart';
import '../../general__widgets/text__field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  // Dependency injection
  final MainController mainController = Get.put(MainController());
  final searchController = Get.lazyPut(() => SearchController());

  //
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
                  const SizedBox(height: 40),

                  //
                  ScreenTitle(
                    title: "search by title",
                    mainController: mainController,
                  ), //

                  //
                  const SizedBox(height: 30),

                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: CustomTextField(
                      key: const Key("search field"),
                      counterTextColor: Theme.of(context).primaryColor,
                      counterBpxColor: Theme.of(context).backgroundColor,
                      textColor: Theme.of(context).primaryColor,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(.2),
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
                    NothingToShow(
                      key: const Key("nothing to show"),
                      text: "search for anything of your notifications",
                      mainController: mainController,
                    )
                  ],

                  if (searchController.searchBarController.text.isNotEmpty &&
                      searchController
                          .filterList(searchController.searchBarController.text)
                          .isEmpty) ...[
                    const SizedBox(height: 100),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          key: const Key("lottie"),
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Lottie.asset(
                                "assets/lottie/not_found.json",
                                width: 120,
                              ),
                            ),
                            NothingToShow(
                              margin: const EdgeInsets.only(right: 20, top: 20),
                              text: "no items found",
                              mainController: mainController,
                            )
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
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 20),
                        ...List.generate(
                          searchController
                              .filterList(
                                  searchController.searchBarController.text)
                              .length,
                          (index) {
                            //
                            List filteredList = searchController.filterList(
                                searchController.searchBarController.text);

                            //
                            int reversedIndex = filteredList.length - index - 1;
                            return NotificationCard(
                              showDeleteButtonOnFullPage: true,
                              currentNotification: filteredList[reversedIndex]
                                  as NewItemNotifcationModel,
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
