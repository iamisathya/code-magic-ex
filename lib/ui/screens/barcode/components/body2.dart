import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';
import '../../inventory/component/page_title.dart';
import '../controller/barcode.scan.controller.dart';
import 'search_textfield.dart';

class Body extends StatelessWidget {
  final BarcodeScannerController controller =
      Get.put(BarcodeScannerController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const PageTitle(title: "Barcode Tracker"),
        SearchTextfield(
            icon: kBarcodeScanIcon,
            labelText: "Order Number",
            onSubmit: () => controller.getBarcodePath(
                context, controller.bardcodeTextField.text),
            textFieldController: controller.bardcodeTextField),
        if (!controller.isLoading.value)
          SvgPicture.asset(kScanBarcodeIllustration, width: 254, height: 252)
      ]),
    );
  }
}
