import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalytics {
  AppAnalytics._();

  static final FirebaseAnalytics _analytics = FirebaseAnalytics();

  static Future<void> setUserId(String userId) async {
    await _analytics.setUserId(userId);
  }

  static Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}
