import 'dart:async';
import 'dart:isolate';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/global_controllers.dart';
import 'controllers/theme_controller.dart';
import 'translations/translations.dart';
import 'navigation/routers.dart';
import 'navigation/routes.dart';
import 'ui/global/theme/app_themes.dart';
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
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());

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
  UserSessionManager.shared.getCurrentLanguage();

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
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
        builder: (languageController) => GetMaterialApp(
              title: 'DSC Tools',
              routes: routes,
              home: SplashScreen(),
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
              ],
              defaultTransition: Transition.cupertino,
              enableLog: true,
              getPages: AppRoutes.routes,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              locale: languageController.getLocale,
              fallbackLocale: languageController.fallbackLocale,
              translations: AppTranslations(),
            ));
  }
}
