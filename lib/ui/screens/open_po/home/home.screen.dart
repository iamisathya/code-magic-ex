import 'package:dsc_tools/ui/screens/home/components/bottom_navigation_bar.dart';
import 'package:dsc_tools/ui/screens/home/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../controller/openpo.controller.dart';
import 'components/app_bar.dart';
import 'components/open_po_order_list.dart';

class OpenPOHomeScreen extends StatelessWidget {
  final OpenPoController controller = Get.put(OpenPoController());
  static const String routeName = '/openPOHomePage';
  final HomeController tabController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
      appBar: OpenPoAppBar(),
      body: OpenPoOrderList(),
      bottomNavigationBar: NavigationBottomBar(controller: tabController, isExternal: true, currentPage: "/createOpenPoOrder"),
    );
  }
}
