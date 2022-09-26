import 'package:watch_it_later/controllers/contact_controller/contact_controller.dart';

extension CountContactTextLengthExtension on ContactController {
  ///  Count handler Method for contactText text field
  Future<void> countContactTextLength(String contactText) async {
    if (contactText.isEmpty) {
      contactTextWrittenLength = 0;
      contactTextCountBoxScale = 0;
    } else {
      contactTextWrittenLength = contactText.length;
      contactTextCountBoxScale = 1;
    }
    update();
    if (contactText.length == contactTextMaxLength) {
      contactTextCountBoxScale = 1.25;
      await Future.delayed(const Duration(milliseconds: 30));
      contactTextCountBoxScale = 1;
    }

    update();
  }
}
