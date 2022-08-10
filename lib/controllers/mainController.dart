import 'package:get/get.dart';

class MainController extends GetxController {

  // make all first letters of strings uppercase
  allFirstWordLetterToUppercase(String text) {
    if (text[text.length - 1] == " ") {
      return text.trim().split(' ').map((word) {
        return word[0].toUpperCase() + word.substring(1) + " ";
      }).join(' ');
    } else {
      return text.split(' ').map((word) {
        return word[0].toUpperCase() + word.substring(1);
      }).join(' ');
    }
  }
}
