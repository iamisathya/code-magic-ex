import 'package:dsc_tools/widgets/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:screenshot/screenshot.dart';

import '../../../utils/constants.dart';
import '../../../utils/images.dart';
import '../../../widgets/page_title.dart';
import '../../open_po/order_create/component/app_bar.dart';
import '../../open_po/order_create/component/loader.dart';
import '../controller/easyship.list.controller.dart';
import 'easyship.item.dart';
import 'tool_box.dart';

class EasyShipOrdersList extends StatelessWidget {
  final EasyShipListController controller = Get.put(EasyShipListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PageTitle(title: "easyship_report".tr),
                    PageToolBox(controller: controller),
                    SingleChildScrollView(
                      child: Screenshot(
                        controller: controller.screenshotController,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: Get.height),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(kEasyShipBgImage),
                              fit: BoxFit.cover,
                            )),
                            child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.allFormattedEasyShipOrders.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                final item = controller
                                    .allFormattedEasyShipOrders[index];
                                return EasyShipItem(item: item, index: index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomButtonBar(
            isShown: !controller.isLoading.value,
            negetiveText: "cancel".tr,
            positiveText: "download".tr,
            onTapCancelButton: Get.back,
            onTapPositiveButton: () => controller.captureScreenShot(Get.context!),
            showNeutral: false,
          ),
        ),
        
      ),
    );
  }
}
