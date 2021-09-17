import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../open_po/home/components/app_bar.dart';
import 'screens/home/body2.dart';

class OrderEntryHomeScreen extends StatelessWidget {
  static const String routeName = '/orderEntryHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: Body());
  }
}
