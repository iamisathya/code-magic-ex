import 'dart:async';
import 'dart:isolate';

import 'package:code_magic_ex/ui/global/routers.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'bloc/main_bloc.dart';
import 'translations/bloc.dart';
import 'translations/translations.dart';
import 'ui/global/routes.dart';
import 'ui/global/theme/app_theme.dart';
import 'ui/global/theme/bloc.dart';
import 'ui/screens/splash/screen.dart';
import 'utilities/connectivity.dart';
import 'utilities/key_value_storage.dart';
import 'utilities/user_session.dart';

// ignore: avoid_void_asyn
Future<void> main() async {
  //* Ensure initialization of Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(); 

  await KeyValueStorageManager.setStorage();
  UserSessionManager.shared.getLoginStatusFromDB();

  //* Connectivity
  ConnectivityManager.shared.doInitialCheck();

  // //* disable collecting in debug mode
  // if (dotenv.env['DEBUG'] == 'True') {
    await FirebaseAnalytics().setAnalyticsCollectionEnabled(false);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  // }

  //* Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  //* To catch errors that happen outside of the Flutter context, install an error listener on the current Isolate:
  Isolate.current.addErrorListener(RawReceivePort((dynamic pair) async {
    final List<dynamic> errorAndStacktrace = pair as List<dynamic>;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first as StackTrace,
      errorAndStacktrace.last as StackTrace,
    );
  }).sendPort);

  //* If you want to catch errors that occur in zones, you can pass FirebaseCrashlytics.instance.recordError to the second parameter of runZonedGuarded
  runZonedGuarded(() {
    runApp(MyApp());
  }, FirebaseCrashlytics.instance.recordError);

  // * Run app normally
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //* init firebase analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

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
            locale: const Locale(
                'en', 'US'), // translations will be displayed in that locale
            fallbackLocale: const Locale('en', 'UK'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // locale: Locale(translationBloc.getCurrentLanguage, ''),
            routes: routes,
            home: SplashScreen(),
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
            ],
            getPages: routers,
          );
        });
  }
}
