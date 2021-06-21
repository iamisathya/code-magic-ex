import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_token.dart';
import 'package:code_magic_ex/ui/screens/home/home.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/ui/screens/login/state.dart';

class LoginBLoc {
  final Stream<LoginPageState> state;
  final Subject<LoginPageState> _stateSubject;

  factory LoginBLoc() {
    final subject = BehaviorSubject<LoginPageState>();
    return LoginBLoc._(
        stateSubject: subject, state: subject.asBroadcastStream());
  }

  LoginBLoc._(
      {required this.state, required Subject<LoginPageState> stateSubject})
      : _stateSubject = stateSubject;

  Future<void> getLoginTokens(BuildContext context) async {
    _stateSubject.add(LoginPageState.loading());

    try {
      final RequestPostCustomerToken request = RequestPostCustomerToken(
          namespace: '${Address.baseUrl}customers',
          type: kEncodeType,
          value: kEncodeValue);

      //*  getLoginTokens from api
      final CustomerToken customerToken =
          await ApiService.init().getLoginTokens(request);
      await UserSessionManager.shared.setLoginTokenIntoDB(customerToken);

      //* getting loginToken by fetching string after last slash /
      final String loginToken = customerToken.customer.href.substring(
          customerToken.customer.href.lastIndexOf("/") + 1,
          customerToken.customer.href.length);

      //*  getCustomerData from api
      final UserInfo responseUserInfo =
          await ApiService.shared().getCustomerData(loginToken);

      //*  Storing user info to db
      await UserSessionManager.shared.setUserInfoIntoDB(responseUserInfo);
      await UserSessionManager.shared.setLoginStatusIntoDB(true);
      _stateSubject.add(LoginPageState(
          customerToken: customerToken, userInfo: responseUserInfo));

      //*  navigate to home page
      Navigator.pushNamedAndRemoveUntil(
          context, MainHomeScreen.routeName, (route) => false);
    } catch (err) {
      _stateSubject.add(LoginPageState.error());
      _stateSubject.addError(err);
      LoggerService.instance.e('API Error: $err');
    }
  }
}

final loginBloc = LoginBLoc();
