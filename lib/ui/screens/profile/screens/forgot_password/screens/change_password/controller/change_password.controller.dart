import 'dart:async';

import 'package:dsc_tools/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  RxString errorMessages = ''.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    emailController.text = Globals.userInfo.email;
    userIdController.text = Globals.userId;
    super.onInit();
  }

  Future<void> onClickContinue() async {
    errorMessages.value = '';
    if (emailController.text.isEmpty) {
      errorMessages.value = 'Empty email address!';
      return;
    }
    isLoading.toggle();
    Timer(const Duration(seconds: 2), () {
      isLoading.toggle();
      errorMessages.value = 'Invalid email address!';
    });
  }
}
