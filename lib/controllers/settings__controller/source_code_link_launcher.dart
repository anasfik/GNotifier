import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers__controllers/dialogs__controller.dart';

class SourceCodeLinkLaunched extends GetxController {
  //
  DialogsController dialogsController = Get.put(DialogsController());

  // parsed URI
  final Uri parsedUri =
      Uri.parse("https://github.com/anasfik/I-will-watch-later");

  // method
  Future<void> openGithubRepositoryURL() async {
    // check wether it can be launched
    bool canUriLaunch = await canLaunchUrl(parsedUri);

    // then launch
    if (canUriLaunch) {
      await launchUrl(
        parsedUri,
        mode: LaunchMode.externalApplication,
      );

      // quit
      return;
    }

    // else show snackbar to user
    dialogsController.showSnackbar("something went wrong");
  }
}
