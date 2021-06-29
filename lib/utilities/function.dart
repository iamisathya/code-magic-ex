import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void renderErrorSnackBar({String title = "", String subTitle = ""}) {
    return Get.snackbar(
      title,
      subTitle,
      titleText: Text(title,
          style: const TextStyle(color: kPrimaryColor, fontSize: 16)),
      messageText: Text(subTitle,
          style: const TextStyle(color: kPrimaryColor, fontSize: 14)),
      backgroundColor: Colors.white,
      borderColor: kPrimaryLightColor,
      animationDuration: const Duration(milliseconds: 300),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10.0,
      borderWidth: 2,
      icon: const Icon(
        Icons.error_outline,
        color: kPrimaryColor,
      ),
    );
  }