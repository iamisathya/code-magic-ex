import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../open_po/home/components/app_bar.dart';
import 'screens/enroll/components/body2.dart';

class EnrollHomeScreen extends StatelessWidget {
  static const String routeName = '/enrollHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: Body());
  }
}
