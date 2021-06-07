// import 'dart:io';
// import 'package:code_magic_ex/utilities/user_session.dart';
// import 'package:edukshema/services/rest_api/client.dart';
// import 'package:edukshema/utilities/user_session.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificationService {
//   final FirebaseMessaging _fcm = FirebaseMessaging();
//   Future initialise() async {
//     if (Platform.isIOS) {
//       _fcm.requestNotificationPermissions(IosNotificationSettings());
//     }
//     _fcm.setAutoInitEnabled(true);
//     _fcm.onTokenRefresh.listen((event) {
//       print(event);
//       UserSessionManager.shared.firebaseToken = event;
//     });
//     _fcm.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//       },
//     );
//   }
// }
