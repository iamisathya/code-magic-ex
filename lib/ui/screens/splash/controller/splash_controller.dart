import 'dart:async';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_token.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/ui/screens/open_po/home/home.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/key_value_storage.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Timer? _timer;
  Rx<FlutterLogoStyle> logoStyle = FlutterLogoStyle.markOnly.obs;
  final CustomerToken customerToken =
      UserSessionManager.shared.getLoginTokensFromDB();

  @override
  void onInit() {
    super.onInit();
    if (_timer != null) return;
    _timer = Timer(const Duration(seconds: 2), () {
      logoStyle.value = FlutterLogoStyle.horizontal;
      fetchCustomerData();
      
    });
    debugPrint(
        " USER KVSM : ${KeyValueStorageManager.getString(KeyValueStorageKeys.loginTokens)}");
  }

  Future<void> fetchCustomerData() async {
    try {
      if (customerToken.token != "" &&
          UserSessionManager.shared.isUserLoggedIn) {
        //*  getCustomerData from api
        final UserInfo responseUserInfo = await ApiService.shared()
            .getCustomerData(UserSessionManager.shared.customerUniqueId);
        await UserSessionManager.shared.setUserInfoIntoDB(responseUserInfo);
        _didSplashCompleted();
      }
    } on DioError catch (e) {
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> _didSplashCompleted() async {
    if (customerToken.token != "" && UserSessionManager.shared.isUserLoggedIn) {
      UserSessionManager.shared.setUserInfoFromDB();
      UserSessionManager.shared.getLoginStatusFromDB();
      UserSessionManager.shared.getProfilePictureFromDB();
      Get.offAll(() => OpenPOHomeScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
}
