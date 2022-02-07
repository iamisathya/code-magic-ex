import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../api/config/api_service.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../models/common_methods.dart';
import '../../../../../../models/error_error_message.dart';
import '../../../../../../models/general_models.dart';
import '../../../../../../navigation/router.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/function.dart';
import '../../../../../global/theme/text_view.dart';
import '../../operation_result/controller/operation_result.controller.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController userIdCtrl = TextEditingController();
  TextEditingController emailAddressCodeCtrl = TextEditingController();
  TextEditingController verificationCodeCtrl = TextEditingController();
  RxString errorMessages = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> sendResetLink() async {
    userIdCtrl.text = '2970466';
    emailAddressCodeCtrl.text = 'sathyanarayana@unicity.com';
    errorMessages.value = '';
    if (userIdCtrl.text.isEmpty) {
      errorMessages.value = "User ID field shouldn't be empty!";
      return;
    }
    if (emailAddressCodeCtrl.text.isEmpty) {
      errorMessages.value = "Email address field shouldn't be empty!";
      return;
    }
    _sendResetLinkNow();
  }

  Future<void> _sendResetLinkNow() async {
    // 2970466
    // sathyanarayana@unicity.com
    try {
      isLoading.toggle();
      final String href =
          "https://hydra.unicity.net/v5a/customers?id.unicity=${userIdCtrl.text}";
      final PasswordResetRequest data = PasswordResetRequest(
          customer: CommonCustomerIdHref(href: href),
          email: emailAddressCodeCtrl.text);
      final dynamic _emailResponse =
          await ApiService.init().sendPasswordResetLink(data);
      isLoading.toggle();
      if (_emailResponse != null) {
        _onResetLinkSent();
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

  void _onResetLinkSent() {
    final Widget _openEmailBtn = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: () => openEmailApp(),
        child: const AppText(
            text: "open_mail",
            style: TextTypes.headline6,
            color: AppColor.dodgerBlue),
      ),
    );
    Get.offAndToNamed(
      ScreenPaths.operationResult,
      arguments: OperationrResultModel(
          buttonText: 'back_to_account'.tr,
          headerText: 'account'.tr,
          message: 'thank_you'.tr,
          subContent: 'Your new email address has been successfully changed',
          onPressDone: () => Get.back(),
          title: 'change_email'.tr,
          secondaryButtonWidget: _openEmailBtn),
    );
  }

  void openEmailApp() {
    if (Platform.isAndroid) {
      debugPrint("Need to be fix");
      // AndroidIntent intent = AndroidIntent(
      //   action: 'android.intent.action.MAIN',
      //   category: 'android.intent.category.APP_EMAIL',
      // );
      // intent.launch().catchError((e) {
      //   debugPrint(e.toString());
      // });
    } else if (Platform.isIOS) {
      launch("message://").catchError((e) {
        debugPrint(e.toString());
      });
    }
  }
}
