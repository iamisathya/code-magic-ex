import 'package:dsc_tools/ui/screens/enroll/screens/enroll/components/body2.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:flutter/material.dart';

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
