import 'package:dsc_tools/models/barcode_item_response.dart';
import 'package:dsc_tools/ui/global/widgets/plain_button.dart';
import 'package:dsc_tools/ui/screens/barcode/components/barcode_list_item.dart';
import 'package:dsc_tools/ui/screens/barcode/components/barcode_product_item.dart';
import 'package:dsc_tools/ui/screens/barcode/controller/barcode.scan.result.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class BarCodeDetails extends StatelessWidget {
  final BarcodeScannResultController controller =
      Get.put(BarcodeScannResultController());
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
                // SearchTextfield(
                //   labelText: "Barcode Number",
                //     onSubmit: () => controller.getBarcodeDetails(),
                //     icon: kBarcodePlainIcon,
                //     textFieldController: controller.bardcodeTextField),
                GestureDetector(
                  onTap: () => controller.navigateToScanBarcode(),
                  child: Container(
                    height: 94,
                    color: const Color(0xFF5297A6),
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      color: Colors.white,
                      height: 54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text("Scan Barcode",
                                style: Theme.of(context).textTheme.subtitle2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: SvgPicture.asset(kBarcodePlainIcon,
                                height: 20,
                                width: 30,
                                semanticsLabel: 'barcode icon'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!controller.isLoading.value &&
                    controller.barcodeItems != null)
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 15.0),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.barcodeItems?.items.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final BarcodeItem item =
                              controller.barcodeItems!.items[index];
                          if (item.require) {
                            return BarcodeProductItem(item: item);
                          }
                          return BarcodeListItem(item: item, index: index);
                        }),
                  )
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
                        onTap: () => controller.showWarningMessage(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: PlainButton(
                        title: 'Save',
                        onTap: () => controller.saveBarcodeDetails(),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
