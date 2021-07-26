import 'dart:async';

import 'package:code_magic_ex/models/user_token.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/ui/screens/order_entry/order_entry.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:code_magic_ex/utilities/key_value_storage.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

  @override
  void initState() {
    super.initState();
    if (_timer != null) return;
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
        Timer(const Duration(seconds: 2), () {
        _didSplashCompleted(context);
      });
    });
    print(
        " USER KVSM : ${KeyValueStorageManager.getString(KeyValueStorageKeys.loginTokens)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(kSplashImage, fit: BoxFit.cover),
        ),
        Align(
          child: FlutterLogo(
            size: 200.0,
            style: _logoStyle,
          ),
        )
      ]),
    );
  }

  Future<void> _didSplashCompleted(BuildContext context) async {
    final CustomerToken customerToken =
        UserSessionManager.shared.getLoginTokensFromDB();

    UserSessionManager.shared.setUserInfoFromDB();
    if (customerToken.token != "" && UserSessionManager.shared.isUserLoggedIn) {
      UserSessionManager.shared.setUserInfoFromDB();
      UserSessionManager.shared.getLoginStatusFromDB();
      UserSessionManager.shared.getProfilePictureFromDB();
      Get.offAll(() => OrderEntryHomeScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }
}
