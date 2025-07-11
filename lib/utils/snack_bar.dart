import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_colors.dart';

class SnackBarUtil {
  static void errorSnackBar(String msg) {
    Get.snackbar('Error', msg,
        duration: 3.seconds,
        isDismissible: true,
        icon: const Icon(
          Icons.error,
          size: 20,
          color: WHITE_COLOR,
        ),
        messageText: Text(
          msg,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
        ),
        titleText: const Text(
          "Error",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }

  static void successSnackBar(String msg) {
    Get.snackbar('Success', msg,
        duration: 3.seconds,
        isDismissible: true,
        icon: const Icon(
          Icons.error,
          size: 20,
          color: WHITE_COLOR,
        ),
        messageText: Text(
          msg,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
        ),
        titleText: const Text(
          "Success",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: APPTHEME_COLOR);
  }
}
