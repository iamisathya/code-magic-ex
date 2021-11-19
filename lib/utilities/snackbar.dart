import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static void showSuccess({String title = "Success", required String message, int duration = 3}) {
    Get.rawSnackbar(
        duration: Duration(seconds: duration),
        title: title,
        icon: const Icon(Icons.thumb_up, color: Colors.white),
        message: message,
        backgroundColor: Colors.green.shade600,
        snackStyle: SnackStyle.GROUNDED);
  }

  static void showWarning({String title = "Warning", required String message, int duration = 3}) {
    Get.rawSnackbar(
        title: title,
        icon: const Icon(Icons.warning, color: Colors.white),
        message: message,
        duration: Duration(seconds: duration),
        backgroundColor: Colors.orange.shade900,
        snackStyle: SnackStyle.GROUNDED);
  }

  static void showError({String title = "Error", required String message, int duration = 3}) {
    Get.rawSnackbar(
        title: title,
        icon: const Icon(Icons.error, color: Colors.white),
        message: message,
        duration: Duration(seconds: duration),
        backgroundColor: Colors.redAccent.shade700,
        snackStyle: SnackStyle.GROUNDED);
  }
}
