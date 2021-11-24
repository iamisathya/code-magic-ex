import 'package:dsc_tools/ui/global/widgets/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:dsc_tools/ui/screens/open_po/controller/add.openpo.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/loader.dart';

import '../../../../../constants/colors.dart';
import 'component/body.dart';

class OpenPoCreateOrder extends StatelessWidget {
  static const String routeName = '/openPoCreateOrder';
  final CreateOpenPoOrderController controller =
      Get.put(CreateOpenPoOrderController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: AppColor.kWhiteSmokeColor,
          appBar: AppBar(
              title: const Text(
            "New PO",
            style: TextStyle(fontSize: 24, color: AppColor.kBlackColor),
          )),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: () => controller.showBottomModal(context),
            negetiveText: "+ Add",
            positiveText: "Place Order",
            onTapPositiveButton: () => controller.validateOrder(context),
          ),
        ),
      ),
    );
  }
}
