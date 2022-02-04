import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/error_error_message.dart';
import 'package:dsc_tools/models/general_models.dart';
import 'package:dsc_tools/models/user_info.dart';
import 'package:dsc_tools/navigation/router.dart';
import 'package:dsc_tools/ui/screens/profile/screens/operation_result/controller/operation_result.controller.dart';
import 'package:dsc_tools/utilities/extensions.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateEmailController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  RxString errorMessages = ''.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    emailController.text = Globals.emailAddress.value;
    userIdController.text = Globals.userId;
    super.onInit();
  }

  Future<void> onClickSave() async {
    errorMessages.value = '';
    if (!emailController.text.isValidEmail()) {
      errorMessages.value = 'Invalid email address!';
      return;
    }
    _uploadEmailAddress();
  }

  Future<void> _uploadEmailAddress() async {
    try {
      isLoading.toggle();
      final Map<String, dynamic> data = {"email": emailController.text};
      final EmailUpdateResponse _emailResponse =
          await ApiService.shared().emailUpdate(data);
      isLoading.toggle();
      if (_emailResponse.email != null) {
        _updateEmailAddressInLocal(_emailResponse);
      }
    } on DioError catch (e) {
      isLoading.toggle();
      if (e.response != null) {
        final ErrorMessage error =
            ErrorMessage.fromJson(e.response!.data as Map<String, dynamic>);
        if (error.error.message!.isNotEmpty) {
          errorMessages.value = error.error.message!;
        }
        returnResponse(e.response!);
      }
    } catch (err, stack) {
      isLoading.toggle();
      debugPrint(err.toString());
      debugPrint(stack.toString());
    }
  }

  void _updateEmailAddressInLocal(EmailUpdateResponse _emailResponse) {
    Globals.emailAddress.value = _emailResponse.email!;
    final UserInfo? info = UserSessionManager.shared.userInfo;
    if (info != null) {
      final String _jsonString = json.encode(info.toMap());
      final Map<String, dynamic> _jsonData =
          json.decode(_jsonString) as Map<String, dynamic>;
      _jsonData["email"] = _emailResponse.email;
      final UserInfo _info = UserInfo.fromJson(_jsonData);
      UserSessionManager.shared.setUserInfoIntoDB(_info);
    }
    SnackbarUtil.showSuccess(
        message: "Email address updated successfully"); //! hardcoded
    navigateToSuccess();
  }

  void navigateToSuccess() {
    Get.offNamedUntil(
      ScreenPaths.operationResult,
      (route) => route.settings.name == ScreenPaths.userProfile,
      arguments: OperationrResultModel(
          buttonText: 'back_to_account'.tr,
          headerText: 'account'.tr,
          message: 'thank_you'.tr,
          subContent: 'Your new email address has been successfully changed',
          onPressDone: () => Get.back(),
          title: 'change_email'.tr),
    );
  }
}
