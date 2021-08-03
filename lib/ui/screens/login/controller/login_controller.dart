import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/models/user_id.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_token.dart';
import 'package:code_magic_ex/ui/global/widgets/confirmation_dialog.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/ui/screens/home/home.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/keyboard.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:code_magic_ex/models/profile_picture.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late String email = kReleaseMode ? "" : "2970466";
  late String password = kReleaseMode ? "" : "1234";
  RxBool remember = false.obs;
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isSessionExpired = false.obs;
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if(data != null) {
      isSessionExpired.value = data as bool;
    }
  }

  void onPressContinue(BuildContext context) {
    if (formKey.currentState!.validate()) {
      isSessionExpired.value = false;
      formKey.currentState!.save();
      getLoginTokens(context);
      KeyboardUtil.hideKeyboard(context);
    }
  }

  String? inputValidate({required String value, required  bool isPassword}) {
    if (value.isEmpty) {
      return isPassword ? kPassNullError : kUserIdNullError;
    }
    return null;
  }

  Future<void> openMailConfirmationDialog(BuildContext context) async {
    final isConfirmed = await ConfirmationDialog.show(
        context: context,
        message: 'Are you sure you want to log out?',
        okText: 'Yes',
        cancelText: 'No');
    if (isConfirmed == false) return;
    _composeMail();
  }

  Future<void> _composeMail() async {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'smith@example.com',
        queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});
    final String _emailUriString =
        // ignore: unnecessary_string_escapes
        _emailLaunchUri.toString().replaceAll('+', '\%20');
    await launch(_emailUriString);
  }

  Future<void> getLoginTokens(BuildContext context) async {
    try {
      _sendingMsgProgressBar.show(context);
      analytics.logLogin();
      final RequestPostCustomerToken request = RequestPostCustomerToken(
          namespace: '${Address.baseUrl}customers',
          type: kEncodeType,
          value: kEncodeValue);

      //*  getLoginTokens from api
      final CustomerToken customerToken =
          await ApiService.init().getLoginTokens(request);
      await UserSessionManager.shared.setLoginTokenIntoDB(customerToken);

      //*  getCustomerData from api
      final UserInfo responseUserInfo =
          await ApiService.shared().getCustomerData(UserSessionManager.shared.customerUniqueId);

      //*  getCustomerData from api
      final ProfilePicture profilePicture =
          await ApiService.shared().getProfilePicture(UserSessionManager.shared.customerUniqueId);

      //*  getCustomerData from api
      final UserId userResponse =
          await MemberCallsService.init().getUserId(kUserId, "2970466");

      //*  Storing user info to db
      UserSessionManager.shared.customerId = userResponse.customerId;
      UserSessionManager.shared.customerCode = userResponse.customerCode;
      UserSessionManager.shared.customerPoCode = userResponse.customerPoCode;
      await UserSessionManager.shared.setUserInfoIntoDB(responseUserInfo);
      await UserSessionManager.shared.setLoginStatusIntoDB(true);
      await UserSessionManager.shared.setProfilePictureToDB(profilePicture);
      //*  navigate to home page
      _sendingMsgProgressBar.hide();
      Get.off(() => MainHomeScreen(), transition: Transition.cupertino);
    } on DioError catch (e) {
      onDioError(e, _sendingMsgProgressBar, errorMessage);
    } catch (err) {
      onCatchError(err, _sendingMsgProgressBar, errorMessage);
    }
  }
}
