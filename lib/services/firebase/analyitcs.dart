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

  static Future<void> trackEvent(
      {required String name, required Map<String, dynamic> params}) async {
    await _analytics.logEvent(
      name: name, //'test_event'
      parameters:
          params, // <String, dynamic>{'string': 'string','int': 42,'long': 12345678910,'double': 42.0,'bool': true,}
    );
  }
}
