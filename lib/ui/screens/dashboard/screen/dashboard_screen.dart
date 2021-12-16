import 'package:dsc_tools/ui/screens/dashboard/components/carousel_slider_custom_indicator.dart';
import 'package:dsc_tools/ui/screens/dashboard/components/dashboard_menu.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard.controller.dart';

class Body extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  static const String routeName = '/dashboardHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: Container(
        decoration: const BoxDecoration(gradient: radialGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSliderWithCustomIndicator(),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(gradient: radialGradient),
                    child: DashboardMenu()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
