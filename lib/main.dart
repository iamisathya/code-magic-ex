import 'package:code_magic_ex/translations/translations.dart';
import 'package:code_magic_ex/ui/screens/order_entry/order_entry.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/order_entry_table/order_entry.dart';
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

  //* disable collecting in debug mode
  // if (dotenv.env['DEBUG'] == 'True') {
  //   await FirebaseAnalytics().setAnalyticsCollectionEnabled(false);
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  // }

  //* Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  //* To catch errors that happen outside of the Flutter context, install an error listener on the current Isolate:
  // Isolate.current.addErrorListener(RawReceivePort((pair) async {
  //   final List<dynamic> errorAndStacktrace = pair;
  //   await FirebaseCrashlytics.instance.recordError(
  //     errorAndStacktrace.first,
  //     errorAndStacktrace.last,
  //   );
  // }).sendPort);
  //* If you want to catch errors that occur in zones, you can pass FirebaseCrashlytics.instance.recordError to the second parameter of runZonedGuarded
  // runZonedGuarded(() {
  //   runApp(MyApp());
  // }, FirebaseCrashlytics.instance.recordError);

  // * Run app normally
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _nextScreen() {
    UserSessionManager.shared.setUserInfoFromDB();
    UserSessionManager.shared.getLoginStatusFromDB();
    final bool isLoggedIn = UserSessionManager.shared.isUserLoggedIn;
    return isLoggedIn ? OrderEntryHomeScreen() : LoginScreen();
  }
  
  //* init firebase analytics
  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer =
  // FirebaseAnalyticsObserver(analytics: analytics);

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
            translations: AppTranslations(),
            locale: const Locale('en', 'US'), // translations will be displayed in that locale
            fallbackLocale: const Locale('en', 'UK'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // locale: Locale(translationBloc.getCurrentLanguage, ''),
            routes: routes,
            home: _nextScreen(),
            // navigatorObservers: [
            //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
            // ],
          );
        });
  }
}
