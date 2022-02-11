import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../core/values/colors.dart';
import '../../../utils/images.dart';
import '../../../widgets/bottom_button_bar.dart';
import '../../open_po/order_create/component/loader.dart';
import '../controller/barcode.search.controller.dart';
import '../widgets/barcode_number_item.dart';
import '../widgets/search_textfield.dart';

class BarCodeSearchScreen extends StatelessWidget {
  final BarcodeSearchController controller = Get.put(BarcodeSearchController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: AppBar(
              title: Obx(() => Text(
                  "${"order_number".tr}: ${controller.orderNumber.value}",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColor.kBlackColor)))),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchTextfield(
                      labelText: "barcode_number".tr,
                      onScan: () => controller.scanBarcodeNumber(context),
                      onSubmit: () => controller
                          .addBarcodeNumber(controller.bardcodeTextField.text),
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
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomButtonBar(
            isShown: !controller.isLoading.value &&
                controller.barcodeList.isNotEmpty,
            negetiveText: "cancel".tr,
            positiveText: "continue".tr,
            onTapCancelButton: Get.back,
            onTapPositiveButton: controller.verifyBarcodeDetails,
            showNeutral: false,
          ),
        ),
      ),
    );
  }
}
