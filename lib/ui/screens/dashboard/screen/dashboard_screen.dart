import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';
import '../../../global/theme/text_view.dart';
import '../../open_po/order_create/component/app_bar.dart';
import '../components/carousel_slider_custom_indicator.dart';
import '../components/dashboard_menu.dart';
import '../controller/dashboard.controller.dart';

class Body extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  static const String routeName = '/dashboardHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(profileIcon: true),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSliderWithCustomIndicator(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: Get.width,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: AppText(
                            text: "Primary Menu",
                            style: TextTypes.headline6,
                            align: TextAlign.left),
                      ),
                    ),
                    DashboardMenu(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
