import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it_later/controllers/main__controller.dart';
import 'package:watch_it_later/view/add_new_item/widgets/description.dart';
import 'package:watch_it_later/view/general__widgets/button.dart';

import '../../controllers/contact_controller/contact_controller.dart';
import '../../controllers/contact_controller/widgets/text__area.dart';
import '../general__widgets/text__field.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final MainController mainController = Get.put(MainController());
  final ContactController contactController = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: SingleChildScrollView(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          // appBar: AppBar(
          //   title: AutoSizeText(
          //     mainController
          //         .allFirstWordLetterToUppercase("feel free to contact"),
          //     maxLines: 1,
          //   ),
          // ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(
                  flex: 3,
                ),
                GetBuilder<ContactController>(
                  builder: (contactController) {
                    return CustomTextField(
                      key: const Key("contact text field"),
                      counterTextColor: Theme.of(context).backgroundColor,
                      isTextArea: true,
                      counterBpxColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(.2),
                      showCounter: true,
                      counterBoxScale:
                          contactController.contactTextCountBoxScale,
                      titleWrittenLength:
                          contactController.contactTextWrittenLength,
                      onChanged: (value) {
                        contactController.countcontactTextLength(value);
                      },
                      maxLength: contactController.contactTextMaxLength,
                      controller: contactController.textAreaEditingController,
                      hintText: mainController.allFirstWordLetterToUppercase(
                          "Write your message here"),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: CustomButton(
                    text: "Send",
                    radiusValue: 10,
                    onPressed: () {},
                    shouldReverseColors: true,
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
