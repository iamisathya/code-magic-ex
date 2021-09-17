import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../open_po/home/components/app_bar.dart';
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
