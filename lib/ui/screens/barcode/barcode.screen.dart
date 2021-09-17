import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'components/body2.dart';

class BarcodeHomeScreen extends StatelessWidget {
  static const String routeName = '/barcodeHomePage';
  static TextEditingController searchConntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: Body());
  }
}
