import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controllers/global_controllers.dart';
import 'core/theme/app_themes.dart';
import 'core/values/translations/translations.dart';
import 'di.dart';
import 'modules/splash/splash.screen.dart';
import 'routes/app_pages.dart';
import 'utils/bindings.dart';

//* github access tokne: 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
Future<void> main() async {
  //* Ensure initialization of Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection().dependencies();

  //* If you want to catch errors that occur in zones, you can pass FirebaseCrashlytics.instance.recordError to the second parameter of runZonedGuarded
  runZonedGuarded(() {
    runApp(MyApp());
  }, FirebaseCrashlytics.instance.recordError);

  // * Run app normally
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //* init firebase analytics
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
      builder: (languageController) => DevicePreview(
        enabled: false,
        builder: (context) => GetMaterialApp(
          title: 'DSC Tools',
          home: SplashScreen(),
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
          ],
          defaultTransition: Transition.cupertino,
          enableLog: true,
          getPages: AppRoutes.routes,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          initialBinding: HomeBindings(),
          locale: languageController.getLocale,
          fallbackLocale: languageController.fallbackLocale,
          translations: AppTranslations(),
        ),
      ),
    );
  }
}
