import 'package:code_magic_ex/ui/screens/demo/screen.dart';
import 'package:code_magic_ex/ui/screens/easy_ship_reports/easy_ship_reports.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/bloc/main_bloc.dart';
import 'package:code_magic_ex/translations/bloc.dart';
import 'package:code_magic_ex/ui/global/theme/bloc.dart';
import 'package:code_magic_ex/ui/screens/inventory/example.dart';
import 'package:code_magic_ex/ui/global/theme/app_theme.dart';
import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/utilities/connectivity.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: avoid_void_async
void main() async {
  // Ensure initialization of Widgets.
  WidgetsFlutterBinding.ensureInitialized();

  /// Connectivity
  ConnectivityManager.shared.doInitialCheck();

  /// Local Key Value DB
  // await KeyValueStorageManager.setStorage();
  // fetchAPI();
  // getTranslations();

  runApp(MyApp());
}

Future getTranslations() async {
  try {
    await MemberService.init().getTranslations("TH,EN");
  } catch (error) {
    return Future.error(error);
  }
}

Future getLoginTokens() async {
  try {
    final RequestPostCustomerToken request = RequestPostCustomerToken(
        namespace: 'https://hydra.unicity.net/v5a/customers',
        type: 'base64',
        value: 'Mjk3MDQ2NjoxMjM0');
    final loginToken = await ApiService.init().getLoginTokens(request);
    // await UserSessionManager.shared.setUserInfoIntoDB(loginToken);
    // getCustomerData('3d9104cc2fa45dbd0bdd1a4261f6969e');
  } catch (error) {
    return Future.error(error);
  }
}

Future fetchAPI() async {
  try {
    await ApiService.shared().getOrdersAndRmas(
        "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c",
        "[2019-01-01;2021-06-01]",
        "order,rma");
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
    return MainStreamBuilder(
        themeBloc: themeBloc.appThemeStream,
        translationBloc: translationBloc.appLanguageStream,
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeBloc.getThemeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(translationBloc.getCurrentLanguage,''),
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            home: EasyShipHomeScreen(),
          );
        });
  }
}
