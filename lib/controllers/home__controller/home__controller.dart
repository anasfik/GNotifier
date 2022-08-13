
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/controllers/get__username__controller/get__username__controller.dart';

class HomeController extends GetxController {
// dependency injection
  final GetUsernameController getUsernameController =
      Get.put(GetUsernameController());

  String getUsername() {
// like we see we opened the box directly cause, it's already open from the getUsernameController
// getting the box
    Box localBox = Hive.box('locals');
// getting the username from the box
    String usernameToShow = localBox.get("username");

// since we didn't save the username value in some variables, we will let the box open, yes, this is fine (from the official hive docs)
// if you think that will cause performance problem, save the value we got into a variable and return it and close the box
// localBox.close();


// got it
    return usernameToShow;
  }
}
