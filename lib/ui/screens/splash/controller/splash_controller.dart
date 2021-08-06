import 'dart:async';

import 'package:code_magic_ex/ui/screens/order_entry/screens/order_complete/order_complete.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../models/user_info.dart';
import '../../../../models/user_token.dart';
import '../../../../utilities/Logger/logger.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/key_value_storage.dart';
import '../../../../utilities/user_session.dart';
import '../../login/login.dart';
import '../../order_entry/order_entry.dart';

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
        _didSplashCompleted(responseUserInfo.id.unicity.toString());
      } else {
        FirebaseAnalytics().logEvent(name: 'log_out',parameters: {'type': "session_expire"});
        Get.offAll(() => LoginScreen());
      }
    } on DioError catch (e) {
      returnResponse(e.response!);
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> _didSplashCompleted(String userId) async {
    if (customerToken.token != "" && UserSessionManager.shared.isUserLoggedIn) {
      UserSessionManager.shared.setUserInfoFromDB();
      UserSessionManager.shared.getLoginStatusFromDB();
      UserSessionManager.shared.getProfilePictureFromDB();
      UserSessionManager.shared.getCustomerIdInfoFromDB();
      FirebaseCrashlytics.instance.setUserIdentifier(userId);
      Get.offAll(() => OrderComplete());
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
