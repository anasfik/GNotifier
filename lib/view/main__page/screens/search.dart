// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/mainController.dart';
import '../../../utils/AppColors.dart';
import '../../general__widgets/text__field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            SizedBox(height: 20),
            AutoSizeText(
              mainController.allFirstWordLetterToUppercase("search by title"),
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
                hintText:
                    mainController.allFirstWordLetterToUppercase("search"),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            //
            SizedBox(height: 30),
            ...List.generate(
              10,
              (index) => Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                height: 120,
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(width: 3.5, color: AppColors.darkBlack),
                      ),
                    ),
                    Container(
                      width: 7,
                      height: 2,
                      color: AppColors.darkBlack,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.darkBlack.withOpacity(.03),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                AutoSizeText(
                                  mainController.allFirstWordLetterToUppercase(
                                      "Blade runner"),
                                  style: TextStyle(
                                    color: AppColors.darkBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxFontSize: 20,
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AutoSizeText(
                                  mainController.allFirstWordLetterToUppercase(
                                      "this is a notification example, for tzsting purpose"),
                                  style: TextStyle(
                                      color:
                                          AppColors.darkBlack.withOpacity(.6),
                                      fontSize: 15),
                                  maxFontSize: 15,
                                  maxLines: 2,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: false,
                            child: Positioned(
                                top: 00,
                                right: 00,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.star_border,
                                    ),
                                  ),
                                )),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
