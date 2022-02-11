import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/provider/globals.dart';
import '../../../../data/services/firebase_remote_config.dart';
import '../../../data/model/country_info.dart';
import '../../../data/model/user_info.dart';
import '../../../data/model/user_token.dart';
import '../../../data/services/api_service.dart';
import '../../../data/services/notifications.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/extensions.dart';
import '../../../utils/function.dart';
import '../../../utils/logger.dart';
import '../../../utils/user_session.dart';
import '../../home/home.dart';
import '../../login/login_home/login_home.dart';

class SplashController extends GetxController {
  final store = GetStorage();
  Timer? _timer;
  Rx<FlutterLogoStyle> logoStyle = FlutterLogoStyle.markOnly.obs;
  final CustomerToken customerToken =
      UserSessionManager.shared.getLoginTokensFromDB();
  RemoteConfigService remoteConfigService = RemoteConfigService();

  @override
  void onInit() {
    super.onInit();
    if (_timer != null) return;
    _timer = Timer(const Duration(seconds: 2), () {
      logoStyle.value = FlutterLogoStyle.horizontal;
      // Get.offAll(() => MainHomeScreen());
      fetchCustomerData();
      remoteConfigService.onInit();
    });
  }

  Future<void> fetchCustomerData() async {
    try {
      if (customerToken.token != "" &&
          UserSessionManager.shared.isUserLoggedIn) {
        //*  getCustomerData from api
        final UserInfo responseUserInfo = await ApiService.shared()
            .getCustomerData(UserSessionManager.shared.customerUniqueId);
        Globals.customerCode = customerToken.customer.href.getAfterLastSlash();
        await UserSessionManager.shared.setUserInfoIntoDB(responseUserInfo);
        await getCurrentMarketConfig();
        _didSplashCompleted(responseUserInfo.id.unicity.toString());
      } else {
        FirebaseAnalytics()
            .logEvent(name: 'log_out', parameters: {'type': "session_expire"});
        Get.offAll(() => LoginScreen());
      }
    } on DioError catch (e) {
      returnResponse(e.response!);
    } catch (err, stack) {
      LoggerService.instance.e(err.toString());
      LoggerService.instance.e(stack.toString());
    }
  }

  Future<void> getCurrentMarketConfig() async {
    try {
      final currentMarket = await store.read('current_market');
      if (currentMarket != null) {
        Globals.currentMarket =
            Markets.fromJson(currentMarket as Map<String, dynamic>);
        Globals.currency = Globals.currentMarket!.currencyCode;
      }
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<void> _setAppAnalytics() async {
    await FirebaseService.setUserId(UserSessionManager.shared.customerId);
    await FirebaseService.setUserId(UserSessionManager.shared.userInfo!.type);
  }

  Future<void> _didSplashCompleted(String userId) async {
    if (customerToken.token != "" && UserSessionManager.shared.isUserLoggedIn) {
      UserSessionManager.shared.setUserInfoFromDB();
      UserSessionManager.shared.getLoginStatusFromDB();
      UserSessionManager.shared.getCustomerIdIntoDB();
      UserSessionManager.shared.getProfilePictureFromDB();
      UserSessionManager.shared.getCustomerIdInfoFromDB();
      FirebaseCrashlytics.instance.setUserIdentifier(userId);
      Globals.customerPoCode =
          UserSessionManager.shared.customerIdInfo!.customerPoCode;
      await _setAppAnalytics();
      // when app is closed and it will be called only once
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {
        try {
          if (message != null) {
            Get.offAllNamed(Routes.SPLASH);
            Get.toNamed(Routes.NOTIFICATIONS);
          } else {
            Get.offAll(() => MainHomeScreen());
          }
        } catch (e) {
          debugPrint(e.toString());
        }
      });
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
