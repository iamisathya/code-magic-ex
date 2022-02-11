// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/material.dart';

// const String enrolmentPaymentMethods = 'enrolment_payment_methods';

// class RemoteConfigService {
//   final RemoteConfig _remoteConfig;
//   RemoteConfigService({required RemoteConfig remoteConfig})
//       : _remoteConfig = remoteConfig;

//   final defaults = <String, dynamic>{
//     enrolmentPaymentMethods: {
//       "markets": [
//         {
//           "code": "th",
//           "methods": [
//             {"id": "card", "name": "Credit Card / Debit Card", "status": true},
//             {"id": "cod", "name": "Cash On Delivery", "status": true},
//             {"id": "cash", "name": "Cash", "status": true},
//             {"id": "ecPay", "name": "ECPay", "status": true},
//             {"id": "promptPay", "name": "Prompt Pay", "status": true},
//             {"id": "bankWire", "name": "BankWire", "status": true}
//           ]
//         }
//       ]
//     }
//   };

//   static late RemoteConfigService? _instance;

//   static Future<RemoteConfigService> getInstance() async {
//     return _instance ??= RemoteConfigService(
//       remoteConfig: RemoteConfig.instance,
//     );
//   }

//   RemoteConfigValue get getEnrolmentPaymentMethods =>
//       _remoteConfig.getValue(enrolmentPaymentMethods);

//   Future initialize() async {
//     try {
//       await _remoteConfig.setDefaults(defaults);
//       await _fetchAndActivate();
//     } on FirebaseException catch (e) {
//       debugPrint("Rmeote Config fetch throttled: $e");
//     } catch (e) {
//       debugPrint("Unable to fetch remote config. Default value will be used");
//     }
//   }

//   Future _fetchAndActivate() async {
//     await _remoteConfig.fetch();
//     await _remoteConfig.fetchAndActivate();
//     debugPrint("boolean::: $getEnrolmentPaymentMethods");
//   }
// }

//* UDSAGE
// print('Welcome ${remoteConfigService.remoteConfig.getString('welcome_message')}');
// EnrolmentPaymentMethods methods = EnrolmentPaymentMethods.fromJson(jsonDecode(payment) as Map<String, dynamic>);

import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RemoteConfigService extends GetxService {
  static RemoteConfigService get find => Get.find();
  RemoteConfig remoteConfig = RemoteConfig.instance;

  Map<String, dynamic> enrolmentPaymentMethods = {
    "markets": [
      {
        "countryCode": "th",
        "paymentModes": [
          {
            "id": "card",
            "name": "Credit Card / Debit Card",
            "status": true,
            "details": {}
          },
          {
            "id": "cod",
            "name": "Cash On Delivery",
            "status": true,
            "details": {}
          },
          {"id": "cash", "name": "Cash", "status": true, "details": {}},
          {"id": "ecPay", "name": "ECPay", "status": true, "details": {}},
          {
            "id": "promptPay",
            "name": "Prompt Pay",
            "status": true,
            "details": {}
          },
          {
            "id": "bankWire",
            "name": "BankWire",
            "status": true,
            "details": [
              {"name": "Mizuho Bank Aoyama Branch", "value": "2583367"},
              {
                "name": "Sumitomo Mitsui Banking Corporation Marunouchi Branch",
                "value": "1166789"
              },
              {
                "name": "Bank of Tokyo-Mitsubishi UFJ Aoyama Branch",
                "value": "4592289"
              },
              {
                "name": "Yucho Bank Transfer Gaienmae Post Office",
                "value": "00100 9 126835"
              },
            ]
          }
        ]
      }
    ]
  };

  @override
  void onInit() {
    _setDefaultValue();
    super.onInit();
  }

  Future<void> _setDefaultValue() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.setDefaults(<String, dynamic>{
      "enrolment_payment_methods": jsonEncode(enrolmentPaymentMethods),
      "welcome_message": "Hi, Placeholder",
    });
    _fetchAndUpdate();
  }

  Future<void> _fetchAndUpdate() async {
    try {
      final List<Future<void>> setupFutures = [
        RemoteConfig.instance.setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 60),
            minimumFetchInterval: const Duration(),
          ),
        ),
        RemoteConfig.instance.fetchAndActivate(),
      ];

      await Future.wait(setupFutures);
      final bool updated = await remoteConfig.fetchAndActivate();
      debugPrint(remoteConfig
          .getAll()
          .toString()); // In real device it will shows the value from my firebase remote config, in simulator only return {}
      if (updated) {
        debugPrint(updated.toString());
        // the config has been updated, new parameter values are available.
      } else {
        debugPrint(updated.toString());
        // the config values were previously updated.
      }
    } on PlatformException catch (exception) {
      // Fetch exception.
      debugPrint(exception.toString());
    } catch (exception) {
      debugPrint(
          'Unable to fetch remote config. Cached or default values will be used');
    }
  }
}
