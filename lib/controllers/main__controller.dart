import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MainController extends GetxController {
  MainController({this.payload});

  // Variables
  String? payload;
  late bool isNewUsingApp;

  /// Watch user status
  bool getUserStatus() {
    // Getting the locals Box
    Box localBox = Hive.box("locals");

    // Getting the value from the box if it's not null(if the user is old one), if it's null, the user is new one
    // In the  getUsernameController, the saveUsernameInBox method, we will set the isNewUsingApp to false, so the user will be redirected to the mainPage directly
    isNewUsingApp = localBox.get('isNewUsingApp') ?? true;

    //
    return isNewUsingApp;
  }

  /// Make all first letters of strings uppercase
  allFirstWordLetterToUppercase(String text) {
    if (text.isEmpty) {
      return text;
    }
    // in case of last letter is " " it makes an error so first :
    if (text[text.length - 1] == " ") {
      return text.trim().split(' ').map((word) {
        return "${word[0].toUpperCase()}${word.substring(1)} ";
      }).join(' ');
    }

    return text.split(' ').map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }
}
