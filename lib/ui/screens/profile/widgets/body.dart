import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/profile/widgets/user_details.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'account_setting_card.dart';
import 'notification_card.dart';
import 'terms_condition_card.dart';
import 'user_info_tag.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const UserDetailsSection(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const AccountSetting(),
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
