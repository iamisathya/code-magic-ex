import 'package:code_magic_ex/ui/global/theme/bloc.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/ui/global/theme/app_theme.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/utilities/connectivity.dart';

// ignore: avoid_void_async
void main() async {
  // Ensure initialization of Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  
  /// Connectivity
  ConnectivityManager.shared.doInitialCheck();

  /// Local Key Value DB
  // await KeyValueStorageManager.setStorage();
  // fetchAPI();
  // getLoginTokens();

  runApp(MyApp());
}

 Future getLoginTokens() async {
    try {
      final RequestPostCustomerToken request = RequestPostCustomerToken(namespace: 'https://hydra.unicity.net/v5a/customers', type: 'base64', value: 'Mjk3MDQ2NjoxMjM0');
      final loginToken = await ApiService.init().getLoginTokens(request);
      // await UserSessionManager.shared.setUserInfoIntoDB(loginToken);
      // getCustomerData('3d9104cc2fa45dbd0bdd1a4261f6969e');
    } catch (error) {
      return Future.error(error);
    }
  }


 Future fetchAPI() async {
    try {
      await ApiService.shared().getOrdersAndRmas("9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c", "[2019-01-01;2021-06-01]", "order,rma");
      // await ApiService.shared().getOrdersAndRmas("9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c", "[2019-01-01;2019-06-01]", "order,rma");
      // await ApiService.shared().findCustomer(108357166, "customer");
      // final customerData = await ApiService.shared().searchCustomer("Test", 1);
    } catch (error) {
      return Future.error(error);
    }
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeTypes>(
      stream: themeBloc.appThemeStream,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme:  AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeBloc.getThemeMode,
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          home: const LoginScreen(key: Key("login")),
        );
      }
    );
  }
}

