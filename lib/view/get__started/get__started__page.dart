import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import 'package:watch_it_later/utils/AppColors.dart';
import 'package:watch_it_later/view/get__started/Constants/dimensions.dart';
import 'package:watch_it_later/view/get__started/widgets/one_face_rounded_box.dart';

import '../general__widgets/button.dart';
import 'widgets/graph__bars.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          // please don't ask why this, it's just a hack, I've used 1.2% of my brain to this
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
                                        color: Theme.of(context).primaryColor,
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
                            color: AppColors.lightGrey,
                            width: GetStartedDimensions
                                .oneFaceRoundedBoxDim['height'] as double,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(right: 27),
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
                        child: Image.asset(
                          "assets/images/scribble.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(left: 27),
                      child: OneFaceRoundedBox(
                        hasBottomLeftRounded: true,
                        hasTopLeftRounded: true,
                        color: AppColors.lightGrey,
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
                              Theme.of(context).primaryColor,
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
              margin: const EdgeInsets.symmetric(horizontal: 27),
              width: double.infinity,
              child: Column(
                children: [
                  AutoSizeText(
                    mainController.allFirstWordLetterToUppercase(
                        "set what you want, we'll remind you"),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      shouldReverseColors: false,
                      onPressed: () {
                        Get.toNamed('/getUsernamePage');
                      },
                      text: mainController
                          .allFirstWordLetterToUppercase("get started")),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
