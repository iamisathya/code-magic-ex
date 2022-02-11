import 'package:flutter/material.dart';

import 'account_setting_card.dart';
import 'notification_card.dart';
import 'terms_condition_card.dart';
import 'user_details.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserDetailsSection(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                AccountSetting(),
                NotificationSetting(),
                const TermsConditionsSetting(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
