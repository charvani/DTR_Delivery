import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common_colors.dart';

class SnackBarUtil {
  static void errorSnackBar(String msg) {
    Get.snackbar('Error', msg,
        duration: 2.seconds,
        isDismissible: true,
        icon: Icon(
          Icons.error,
          size: 20.h,
          color: WHITE_COLOR,
        ),
        messageText: Text(
          msg,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14.sp),
        ),
        titleText: Text(
          "Error",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.sp),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }

  static void successSnackBar(String msg) {
    Get.snackbar('Success', msg,
        duration: 2.seconds,
        isDismissible: true,
        icon: Icon(
          Icons.error,
          size: 20.h,
          color: WHITE_COLOR,
        ),
        messageText: Text(
          msg,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14.sp),
        ),
        titleText: Text(
          "Success",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.sp),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: GREEN_COLOR);
  }
}
