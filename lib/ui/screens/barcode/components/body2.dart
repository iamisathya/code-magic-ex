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
      child: SizedBox(
        height: Get.height - 108,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    PageTitle(title: "barcode_tracker".tr),
                    SearchTextfield(
                        icon: kBarcodeScanIcon,
                        labelText: "Order Number",
                        onSubmit: () => controller.getBarcodePath(
                            context, controller.bardcodeTextField.text),
                        onScan: () => controller.scanBarcode(context),
                        textFieldController: controller.bardcodeTextField),
                  ],
                ),
              ),
              if (!controller.isLoading.value)
                Expanded(
                  child: SvgPicture.asset(kScanBarcodeIllustration,
                      width: 254, height: 252),
                ),
              const Expanded(child: SizedBox()),
            ]),
      ),
    );
  }
}
