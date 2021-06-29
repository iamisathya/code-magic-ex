import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/component/body.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:code_magic_ex/utilities/constants.dart';

import 'package:flutter/material.dart';

class SalesReportsHomeScreen extends StatelessWidget {
  static const String routeName = '/salesReportsHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: AppBar(
          title: const Text("Sales Report"),
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
