import 'dart:async';

import 'package:dsc_tools/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController emailAddressCodeCtrl = TextEditingController();
  TextEditingController verificationCodeCtrl = TextEditingController();
  RxString errorMessages = ''.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    userNameCtrl.text = Globals.userInfo.humanName.fullName;
    super.onInit();
  }

  Future<void> onClickSave() async {
    errorMessages.value = '';
    if (emailAddressCodeCtrl.text.isEmpty) {
      errorMessages.value = 'Empty verification code!';
      return;
    }
    isLoading.toggle();
    Timer(const Duration(seconds: 2), () {
      isLoading.toggle();
      errorMessages.value = 'Invalid verification code!';
    });
  }
}
