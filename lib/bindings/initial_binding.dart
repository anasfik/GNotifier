import 'package:get/get.dart';

import '../controllers/main__controller.dart';
import '../controllers/settings__controller/dark__mode_setting.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);
    Get.put(ThemeController());
  }
}
