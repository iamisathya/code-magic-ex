import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../../widgets/text_view.dart';
import '../../open_po/order_create/component/app_bar.dart';
import '../controller/dashboard.controller.dart';
import '../widgets/carousel_slider_custom_indicator.dart';
import '../widgets/dashboard_menu.dart';

class Body extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(leading: "profile", showNotification: true),
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
