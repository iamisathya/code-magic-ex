import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/ui/screens/profile/components/body.dart';

import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  static const String routeName = "/userProfileScreen";
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: const Body(),
    );
  }
}