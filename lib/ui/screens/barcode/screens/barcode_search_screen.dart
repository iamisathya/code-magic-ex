import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utilities/images.dart';
import '../../../global/widgets/plain_button.dart';
import '../../open_po/home/components/loader.dart';
import '../components/barcode_number_item.dart';
import '../components/search_textfield.dart';
import '../controller/barcode.search.controller.dart';

class BarCodeSearchScreen extends StatelessWidget {
  final BarcodeSearchController controller = Get.put(BarcodeSearchController());
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
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchTextfield(
                      labelText: "Barcode Number",
                      onScan: () => null,
                      onSubmit: () => controller.addBarcodeNumber(),
                      icon: kBarcodePlainIcon,
                      textFieldController: controller.bardcodeTextField),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.barcodeList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final String barcodeNumber =
                              controller.barcodeList[index];
                          return BarcodeTextItem(
                              text: barcodeNumber,
                              index: index,
                              onDelete: controller.removeBarcodeNumber);
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => controller.isLoading.value || controller.barcodeList.isEmpty
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
                        title: 'Continue',
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
