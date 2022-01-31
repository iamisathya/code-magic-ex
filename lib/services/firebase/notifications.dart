import 'dart:async';

import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/navigation/router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  Get.toNamed(
    ScreenPaths.notifications,
  );
  // try {
  //   Get.toNamed(
  //     ScreenPaths.notifications,
  //   );
  //   final dynamic path = message.data["status"];
  //   // if (path != null) {
  //   //   Get.toNamed(
  //   //     ScreenPaths.notifications,
  //   //   );
  //   // }
  // } catch (e) {
  //   debugPrint(e.toString());
  // }
  // if (message.data.containsKey('data')) {
  //   // Handle data message
  //   final data = message.data['data'];
  //   debugPrint(data.toString());
  // }

  // if (message.data.containsKey('notification')) {
  //   // Handle notification message
  //   final notification = message.data['notification'];
  //   debugPrint(notification.toString());
  // }
  // Or do other work.
}

class FirebaseService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) {
      FirebaseService().displayLocalNotification(id, title, body, payload);
    },
  );

  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();

  Future<void> selectNotification(String? payload) async {
    if (payload != null) {
      Get.toNamed(ScreenPaths.notifications);
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> initialisePlugin() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void displayLocalNotification(
      int id, String? title, String? body, String? payload) {
    _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "channel.id",
          "channel.name",
          channelDescription: "channel.description",
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }

  void setNotifications() {
    //* Android: when app in Background, killed.
    //* iOS: when app in Background, killed, Foreground.
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    //* Android: when app in foreground.
    FirebaseMessaging.onMessage.listen(
      (message) async {
        final RemoteNotification? notification = message.notification;
        final AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          displayLocalNotification(
              notification.hashCode, notification.title, notification.body, "");
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //* ontap notification message
      //* iOS: Background, Foregroud, Killed.
      //* Android: Background, Foregroud, Killed.
      try {
        final dynamic path = message.data["screen"];
        if (path != null) {
          Get.toNamed(path.toString());
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });

    
  }

  static Future<void> initialiseFirebaseService() async {
    await Firebase.initializeApp();
    await instanceId();
    FirebaseService().setNotifications();
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await FirebaseMessaging.instance.subscribeToTopic("topup");
    await FirebaseService().initialisePlugin();
  }

  static Future<void> instanceId() async {
    final String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      Globals.firebaseToken = token;
    }
    debugPrint("Firebase Instance Token ID: ${token!}");
  }

  static Future<void> triggerInAppMessage() async {
    FirebaseInAppMessaging.instance.triggerEvent("");
    FirebaseMessaging.instance.sendMessage();
    FirebaseMessaging.instance.getInitialMessage();
  }

  static Future<void> setUserId(String userId) async {
    await _analytics.setUserId(userId);
  }

  static Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  void dispose() {
    streamCtlr.close();
    bodyCtlr.close();
    titleCtlr.close();
  }
}
