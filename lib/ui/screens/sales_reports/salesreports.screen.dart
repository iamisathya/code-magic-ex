import 'package:dsc_tools/ui/global/widgets/sign_out_button.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../utilities/constants.dart';
import '../open_po/home/components/app_bar.dart';
import '../open_po/home/components/loader.dart';
import 'component/body2.dart';
import 'controller/salesreports.home.controller.dart';

class SalesReportsHomeScreen extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
  static const String routeName = '/salesReportsHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
      appBar: OpenPoAppBar(),
      body: Obx(
        () => LoadingOverlay(
            isLoading:
                controller.isLoading.value || controller.isPrinting.value,
            progressIndicator: const Loader(),
            child: Body2()),
      ),
      floatingActionButton:
          !controller.isLoading.value && controller.activeListLength == 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SignOutButton(
                    title: "Find Sales Report",
                    onPress: () => controller.getAllSalesReports(),
                    bgColor: const Color(0xFF9EA9B9),
                    icon: kArrowIcon,
                    height: 50,
                    fgColor: const Color(0xFFFFFFFF),
                    iconColor: const Color(0xFFFFFFFF),
                  ),
                )
              : const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
