import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HideDeleteButtonForFavoritesSetting extends GetxController {
  // bool
  static Box localBox = Hive.box("locals");

  bool isDeleteButtonHidden = localBox.get("isDeleteButtonHidden") ?? true;

  //toggle method
  setToHideDeleteButton(boolValue) {
    isDeleteButtonHidden = boolValue;
    update();
    localBox.put("isDeleteButtonHidden", isDeleteButtonHidden);
  }

  getIsHideDeleteButton() {
    return isDeleteButtonHidden;
  }
}
