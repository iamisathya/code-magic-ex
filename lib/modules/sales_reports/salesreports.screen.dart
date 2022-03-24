import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../utils/constants.dart';
import '../../widgets/bottom_button_bar.dart';
import '../open_po/order_create/component/app_bar.dart';
import '../open_po/order_create/component/loader.dart';
import 'component/body2.dart';
import 'controller/salesreports.home.controller.dart';

class SalesReportsHomeScreen extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value || controller.isPrinting.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: Body2(),
          bottomNavigationBar: BottomButtonBar(
            isShown: !controller.isLoading.value,
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "cancel".tr,
            positiveText: "find_report".tr,
            onTapPositiveButton: () => controller.getAllSalesReports(),
          ),
        ),
      ),
    );
  }
}
