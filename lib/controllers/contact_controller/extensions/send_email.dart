import 'package:url_launcher/url_launcher.dart';
import 'package:watch_it_later/controllers/contact_controller/contact_controller.dart';
import 'package:watch_it_later/controllers/helpers__controllers/extensions/show_snackbar.dart';
import 'package:watch_it_later/utils/extensions/string_extension.dart';

extension SendEmailExtension on ContactController {
  /// Send mailto method to an email
  Future<void> sendMailto({
    String developerEmail = "ffikhi.aanas@gmail.com",
  }) async {
    final String emailSubject = "$username Contacted you from GNotifier app";
    final Uri parsedMailto = Uri.parse(
        "mailto:<$developerEmail>?subject=$emailSubject&body=${textAreaEditingController.text}");

    if (!await launchUrl(
      parsedMailto,
      mode: LaunchMode.externalApplication,
    )) {
      dialogsController.showSnackbar(
          "something wrong occurred ! ".capitalizeAllWordsFirstLetter());
    }
  }
}
