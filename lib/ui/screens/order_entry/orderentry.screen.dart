import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/home/body2.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:flutter/material.dart';

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
