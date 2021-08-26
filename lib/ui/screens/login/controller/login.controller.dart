import 'dart:convert';

import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/country_info.dart';
import 'package:dsc_tools/ui/screens/open_po/home/home.screen.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../api/api_address.dart';
import '../../../../api/config/api_service.dart';
import '../../../../api/request/request_customer_token.dart';
import '../../../../models/profile_picture.dart';
import '../../../../models/user_id.dart';
import '../../../../models/user_info.dart';
import '../../../../models/user_token.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/keyboard.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/widgets/confirmation_dialog.dart';
import '../../../global/widgets/overlay_progress.dart';

class LoginController extends GetxController {
  final store = GetStorage();

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
    if (data != null) {
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

  String? inputValidate({required String value, required bool isPassword}) {
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
      final UserInfo responseUserInfo = await ApiService.shared()
          .getCustomerData(UserSessionManager.shared.customerUniqueId);

      //*  getCustomerData from api
      final Markets? currentMarket = await getMarketConfig(
          responseUserInfo.mainAddress.country.toLowerCase());

      if (currentMarket == null) throw "Your market is not supported";

      //*  getCustomerData from api
      final ProfilePicture profilePicture = await ApiService.shared()
          .getProfilePicture(UserSessionManager.shared.customerUniqueId);

      //*  getCustomerData from api
      final UserId userResponse =
          await MemberCallsService.init().getUserId(kUserId, "2970466");

      //*  Storing user info to db
      await store.write('current_market', currentMarket);
      Globals.currentMarket = currentMarket;
      Globals.currency = currentMarket.currency;

      UserSessionManager.shared.customerId = userResponse.customerId;
      UserSessionManager.shared.customerCode = userResponse.customerCode;
      UserSessionManager.shared.customerPoCode = userResponse.customerPoCode;
      await UserSessionManager.shared.setUserInfoIntoDB(responseUserInfo);
      await UserSessionManager.shared.setLoginStatusIntoDB(true);
      await UserSessionManager.shared.setProfilePictureToDB(profilePicture);
      await UserSessionManager.shared.setCustomerIdInfo(userResponse);
      //*  navigate to home page
      _sendingMsgProgressBar.hide();
      Get.off(() => OpenPOHomeScreen(), transition: Transition.cupertino);
    } on DioError catch (e) {
      onDioError(e, _sendingMsgProgressBar, errorMessage);
    } catch (err) {
      onCatchError(err, _sendingMsgProgressBar, errorMessage);
    }
  }

  Future<Markets?> getMarketConfig(String country) async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/market_config.json');
      final data = await json.decode(response);
      if (data != null) {
        final marketInfo = AllMarkets.fromJson(data as Map<String, dynamic>);
        return marketInfo.markets
            .firstWhere((market) => market.code == country);
      }
    } catch (err) {
      LoggerService.instance.e(err.toString());
      return null;
    }
  }
}
