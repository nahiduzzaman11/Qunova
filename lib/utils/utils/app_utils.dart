import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qunova/utils/color/app_color.dart';

class Utils {
  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.white_20,
      textColor: AppColors.white_100,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.white_20,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColors.white_100,
    );
  }

  static void snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      animationDuration: const Duration(seconds: 1),
      backgroundColor: AppColors.white_20,
      barBlur: 0,
      colorText: AppColors.white_100,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
