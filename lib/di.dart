import 'dart:isolate';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/global_controllers.dart';
import 'data/services/notifications.dart';
import 'utils/connectivity.dart';
import 'utils/key_value_storage.dart';
import 'utils/user_session.dart';

class DenpendencyInjection extends Bindings {
  @override
  Future<void> dependencies() async {
    //storageCtrl user preferences
    // await Get.putAsync(() async {
    //   await GetStorage.init();
    //   await SharedPreferences.getInstance();
    //   final storageCtrl = StorageCtrl();
    //   await storageCtrl.storageCtrlInit();
    //   return storageCtrl;
    // }, permanent: true);

    //notifications custom ctrl to handle the incoming pending notifications
    // await Get.putAsync<NotificationsCtrl>(() async {
    //   final notificationsCtrl = NotificationsCtrl();
    //   await notificationsCtrl.notificationsInit();
    //   return notificationsCtrl;
    // }, permanent: true);

    //firebase messaging init <--- here
    await Get.putAsync<FirebaseService>(() async {
      final firebaseMessengerSer = FirebaseService();
      await firebaseMessengerSer.initialiseFirebaseService();
      return firebaseMessengerSer;
    }, permanent: true);

    //ThemeController init <--- here
    await Get.putAsync<ThemeController>(() async {
      final themeController = ThemeController();
      return themeController;
    }, permanent: true);

    //LanguageController init <--- here
    await Get.putAsync<LanguageController>(() async {
      final languageController = LanguageController();
      return languageController;
    }, permanent: true);

    //user preferences
    await GetStorage.init();

    //dot env
    await dotenv.load();

    await KeyValueStorageManager.setStorage();
    //* Connectivity
    await Get.putAsync<UserSessionManager>(() async {
      final connectivityManager = UserSessionManager.shared;
      connectivityManager.getLoginStatusFromDB();
      return connectivityManager;
    }, permanent: true);

    //* Connectivity
    await Get.putAsync<ConnectivityManager>(() async {
      final connectivityManager = ConnectivityManager.shared;
      connectivityManager.doInitialCheck();
      return connectivityManager;
    }, permanent: true);

    // //* disable collecting in debug mode
    if (dotenv.env['DEBUG'] == 'True') {
      await FirebaseAnalytics().setAnalyticsCollectionEnabled(false);
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }

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

    debugPrint('ServicesSer has finished');
  }
}
