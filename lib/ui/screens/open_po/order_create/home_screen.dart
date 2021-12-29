import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants/colors.dart';
import '../../../global/widgets/bottom_button_bar.dart';
import 'component/body.dart';
import 'component/loader.dart';
import 'controller/add.openpo.controller.dart';

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
              title: Text(
            "add_new_po".tr,
            style: const TextStyle(fontSize: 24, color: AppColor.kBlackColor),
          )),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: () => controller.showBottomModal(context),
            negetiveText: "plus_add".tr,
            positiveText: "place_order".tr,
            onTapPositiveButton: () => controller.validateOrder(context),
          ),
        ),
      ),
    );
  }
}
