import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/ui/screens/home/home.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/models/user_token.dart';

class LoginBLoc {
  final BehaviorSubject<CustomerToken> _subject = BehaviorSubject<CustomerToken>();

    final _activityIndicatorStreamController =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get activityIndicatorStream =>
      _activityIndicatorStreamController.stream;

  Function(bool)? get _setActivityIndicatorStream =>
      _activityIndicatorStreamController.isClosed
          ? null
          : _activityIndicatorStreamController.sink.add;
          

  Future<void> getLoginToken(BuildContext context) async{
    final RequestPostCustomerToken request = RequestPostCustomerToken(namespace: '${Address.baseUrl}${Address.customersPath}', type: encodetype, value: encodeValue);
    _setActivityIndicatorStream!(true);
    final CustomerToken customerToken = await ApiService.init().getLoginTokens(request);
     Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainHomeScreen()),
              (_) => false);
    _setActivityIndicatorStream!(false);
    _subject.sink.add(customerToken);
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<CustomerToken> get subject => _subject;
}

final loginBloc = LoginBLoc();