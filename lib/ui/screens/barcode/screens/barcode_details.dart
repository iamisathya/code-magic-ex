import 'package:dsc_tools/models/barcode_item_response.dart';
import 'package:dsc_tools/ui/global/widgets/plain_button.dart';
import 'package:dsc_tools/ui/screens/barcode/components/barcode_product_item.dart';
import 'package:dsc_tools/ui/screens/barcode/components/search_textfield.dart';
import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.controller.dart';
import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.result.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class BarCodeDetails extends StatelessWidget {
  final BarcodeScannResultController controller =
      Get.put(BarcodeScannResultController());
  final BarcodeScannerController orderController =
      Get.put(BarcodeScannerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text("Order Number: ${controller.orderNumber.value}",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color(0xFF000000))))),
      body: Obx(
        () => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchTextfield(
                    labelText: "Scan Barcode",
                    onSubmit: () => controller.getBarcodeDetails(),
                    icon: kBarcodePlainIcon,
                    textFieldController: controller.bardcodeTextField),
                if (!controller.isLoading.value &&
                    controller.barcodeItems != null)
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.barcodeItems?.items.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final BarcodeItem item =
                            controller.barcodeItems!.items[index];
                        return BarcodeProductItem(item: item);
                      })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => controller.isLoading.value
            ? const SizedBox()
            : Container(
                height: 90,
                color: const Color(0xFFE3E8ED),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: PlainButton(
                        buttonColor: const Color(0xFFFFBF3A),
                        title: 'Cancel',
                        titleColor: const Color(0xFF000000),
                        onTap: () => null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: PlainButton(
                        title: 'Save',
                        onTap: () => null,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
