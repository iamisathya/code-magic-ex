import 'package:dsc_tools/constants/globals.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Messaging {
  Messaging._();

  static Future<void> instanceId() async {
    await Firebase.initializeApp();
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
}
