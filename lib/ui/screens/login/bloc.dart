import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/models/user_token.dart';
import 'package:code_magic_ex/ui/screens/home/home.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
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
      final CustomerToken customerToken =
          await ApiService.init().getLoginTokens(request);
      _stateSubject.add(LoginPageState(customerToken: customerToken));
      Navigator.pushNamedAndRemoveUntil(context, MainHomeScreen.routeName, (route) => false);
      //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHomeScreen()),(_) => false);
    } catch (err) {
      _stateSubject.add(LoginPageState.error());
      _stateSubject.addError(err);
    }
  }
}

final loginBloc = LoginBLoc();
