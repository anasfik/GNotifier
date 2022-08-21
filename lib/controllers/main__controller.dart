import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/controllers/notifications__controllers/new__item__notification__error__controller.dart';

class MainController extends GetxController {
  MainController({this.payload});

  // Variables
  String? payload;
  late bool isNewUsingApp;


  // Watch user status
  bool getUserStatus() {
// getting the locals Box

    Box localBox = Hive.box("locals");
    // getting the value from the box if it's not null(if the user is old one), if it's null, the user is new one
    // in the  getUsernameController, the saveUsernameInBox method, we will set the isNewUsingApp to false, so the user will be redirected to the mainPage directly
    isNewUsingApp = localBox.get('isNewUsingApp') ?? true;

    //
    return isNewUsingApp;
  }

  // make all first letters of strings uppercase
  allFirstWordLetterToUppercase(String text) {
    if (text.isEmpty) {
      return text;
    }
    // in case of last word is " " it makes an error so first :
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
