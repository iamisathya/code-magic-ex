import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../routes/app_pages.dart';
import '../../../../operation_result/controller/operation_result.controller.dart';

class ChangePasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  RxString errorMessages = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> onClickContinue() async {
    errorMessages.value = '';
    if (newPasswordController.text.isEmpty) {
      errorMessages.value = 'Empty password field!';
      return;
    }
    isLoading.toggle();
    Timer(const Duration(seconds: 2), () {
      isLoading.toggle();
      errorMessages.value = 'Invalid password entered!';
    });
    Get.offNamedUntil(
      Routes.OPERATION_RESULT,
      (route) => route.settings.name == Routes.USER_PROFILE,
      arguments: OperationrResultModel(
          buttonText: 'back_to_account'.tr,
          headerText: 'account'.tr,
          message: 'thank_you'.tr,
          subContent: 'Your new password has been successfully changed',
          onPressDone: () => Get.back(),
          title: 'change_password'.tr),
    );
  }
}
