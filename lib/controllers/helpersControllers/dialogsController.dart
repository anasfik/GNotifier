import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogsController extends GetxController {

  showConfirmWithActions(
      String infoText, String actionButtonText, void Function()? function) {
    Get.defaultDialog(
        title: "",
        backgroundColor: const Color(0xff131429),
        content: Column(
          children: [
            const Icon(Icons.warning, color: Color(0xff40D876), size: 60),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: Text(
                infoText,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            onPressed: function,
            child: Text(
              actionButtonText,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ]);
  }

  showError(String errorText) {
    Get.defaultDialog(
        title: "",
        backgroundColor: const Color(0xff131429),
        content: Column(
          children: [
            const Icon(Icons.error, color: Colors.red, size: 60),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: Text(
                errorText,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }

  //
  showSuccess(String successText) {
    Get.defaultDialog(
        title: "",
        backgroundColor: const Color(0xff131429),
        content: Column(
          children: [
            const Icon(Icons.done, color: Color(0xff40D876), size: 60),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: Text(
                successText,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
