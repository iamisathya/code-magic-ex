import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../routes/app_pages.dart';

class VerifyCodeController extends GetxController {
  TextEditingController verificationCodeCtrl = TextEditingController();
  RxString errorMessages = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> onClickSave() async {
    errorMessages.value = '';
    if (verificationCodeCtrl.text.isEmpty) {
      errorMessages.value = 'Empty email address!';
      return;
    }
    isLoading.toggle();
    Timer(const Duration(seconds: 2), () {
      isLoading.toggle();
      errorMessages.value = 'Invalid email address!';
    });
    Get.toNamed(Routes.CHANGE_PASSWORD);
  }
}
