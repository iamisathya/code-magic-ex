import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/sales_reports/controller/salesreports.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../../utilities/constants.dart';
import 'component/body.dart';
import 'component/body2.dart';

class SalesReportsHomeScreen extends StatelessWidget {
  final SalesReportController controller = Get.put(SalesReportController());
  static const String routeName = '/salesReportsHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        drawer: NavigationDrawer(),
        body: Body2());
  }
}
