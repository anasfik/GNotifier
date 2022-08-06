// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/mainController.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/get__started/Constants/dimensions.dart';
import 'package:watch_it_later/view/get__started/widgets/one_face_rounded_box.dart';

import '../general__widgets/button.dart';
import 'widgets/graph__bars.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkBlack,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          left: 27 + 100 + 8,
                          child: OneFaceRoundedBox(
                            width: 0,
                            color: AppColors.lightGrey,
                            //
                            // width: GetStartedDimensions
                            //     .oneFaceRoundedBoxDim["width"] as double,
                            height: GetStartedDimensions
                                .oneFaceRoundedBoxDim["height"] as double,
                            roundedBy: GetStartedDimensions
                                    .oneFaceRoundedBoxDim["borderRadiusValue"]
                                as double,
                            hasTopLeftRounded: true,
                            hasBottomLeftRounded: true,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  top: 10,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.darkBlack,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 27,
                          top: 0,
                          bottom: 0,
                          child: OneFaceRoundedBox(
                            hasBottomRightRounded: true,
                            hasBottomLeftRounded: true,
                            roundedBy: GetStartedDimensions
                                    .oneFaceRoundedBoxDim["borderRadiusValue"]
                                as double,
                            color: AppColors.lightGreen,
                            width: GetStartedDimensions
                                .oneFaceRoundedBoxDim['height'] as double,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(right: 27),
                      child: OneFaceRoundedBox(
                        hasBottomRightRounded: true,
                        hasTopRightRounded: true,
                        color: AppColors.lightGrey,
                        width: double.infinity,
                        height: GetStartedDimensions
                            .oneFaceRoundedBoxDim['height'] as double,
                        roundedBy: GetStartedDimensions
                                .oneFaceRoundedBoxDim["borderRadiusValue"]
                            as double,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(left: 27),
                      child: OneFaceRoundedBox(
                        hasBottomLeftRounded: true,
                        hasTopLeftRounded: true,
                        color: AppColors.lightGreen,
                        width: double.infinity,
                        height: GetStartedDimensions
                            .oneFaceRoundedBoxDim['height'] as double,
                        roundedBy: GetStartedDimensions
                                .oneFaceRoundedBoxDim["borderRadiusValue"]
                            as double,
                        child: Center(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GraphBars(
                            barsBoundedBy: 5,
                            colors: [
                              AppColors.darkBlack,
                              AppColors.lightGrey,
                            ],
                            values: const [
                              40,
                              30,
                              20,
                              40,
                              40,
                              60,
                              50,
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    child: AutoSizeText(
                      mainController.allFirstWordLetterToUppercase(
                          "set what you want, we'll remind you"),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      text: mainController
                          .allFirstWordLetterToUppercase("get started")),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
