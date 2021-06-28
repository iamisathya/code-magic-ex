import 'package:code_magic_ex/ui/screens/easy_ship/home.dart';
import 'package:code_magic_ex/utilities/connectivity.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/ui/global/routes.dart';
import 'package:code_magic_ex/ui/screens/login/login.dart';
import 'package:code_magic_ex/utilities/key_value_storage.dart';
import 'package:code_magic_ex/bloc/main_bloc.dart';
import 'package:code_magic_ex/translations/bloc.dart';
import 'package:code_magic_ex/ui/global/theme/bloc.dart';
import 'package:code_magic_ex/ui/global/theme/app_theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';



// ignore: avoid_void_async
void main() async {
  //* Ensure initialization of Widgets.
  WidgetsFlutterBinding.ensureInitialized();  

  //* Connectivity
  ConnectivityManager.shared.doInitialCheck();

  //* Local Key Value DB
  await KeyValueStorageManager.setStorage();

  // * Run app normally
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _nextScreen() {
    UserSessionManager.shared.getLoginStatusFromDB();
    final bool isLoggedIn = UserSessionManager.shared.isUserLoggedIn;
    return isLoggedIn ? EasyShipHomeScreen() : LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MainStreamBuilder(
        themeBloc: themeBloc.appThemeStream,
        translationBloc: translationBloc.appLanguageStream,
        builder: (context) {
          return GetMaterialApp(
            title: 'DSC Tools',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeBloc.getThemeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(translationBloc.getCurrentLanguage, ''),
            routes: routes,
            home: _nextScreen(),
          );
        });
  }
}
