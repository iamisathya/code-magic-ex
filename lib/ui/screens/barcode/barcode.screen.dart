import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../utilities/constants.dart';
import '../open_po/home/components/app_bar.dart';
import 'components/body2.dart';
import 'controller/barcode.scan.controller.dart';

class BarcodeHomeScreen extends StatelessWidget {
  static const String routeName = '/barcodeHomePage';
  final BarcodeScannerController controller =
      Get.put(BarcodeScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            progressIndicator: const Loader(),
            child: Body())));
  }
}
