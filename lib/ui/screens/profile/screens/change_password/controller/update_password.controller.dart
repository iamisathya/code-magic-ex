import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController enteNewPasswordCtrl = TextEditingController();
  TextEditingController reEnterNewPasswordCtrl = TextEditingController();
  RxBool enterPasswordIsObscure = true.obs;
  RxBool reEnterPasswordIsObscure = true.obs;
  RxString errorMessages = ''.obs;

  // enter password field show/hide
  bool get isEnterPasswordIsObscure => enterPasswordIsObscure.value;
  set isEnterPasswordIsObscure(bool value) => enterPasswordIsObscure.value = value;

  // re-enter password field show/hide
  bool get isReEnterPasswordIsObscure => reEnterPasswordIsObscure.value;
  set isReEnterPasswordIsObscure(bool value) => reEnterPasswordIsObscure.value = value;

  RxBool isLoading = false.obs;

  Future<void> onClickSave() async {
    errorMessages.value = '';
    if (currentPasswordCtrl.text.isEmpty ||
        enteNewPasswordCtrl.text.isEmpty ||
        reEnterNewPasswordCtrl.text.isEmpty) {
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
