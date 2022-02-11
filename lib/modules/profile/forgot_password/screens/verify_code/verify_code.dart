import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../../widgets/bottom_button_bar.dart';
import '../../../../open_po/order_create/component/app_bar.dart';
import '../../../../open_po/order_create/component/loader.dart';
import 'controller/verify_code.controller.dart';
import 'widgets/body.dart';

class VerifyCodeScreen extends StatelessWidget {
  final VerifyCodeController controller = Get.put(VerifyCodeController());

  VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: OpenPoAppBar(),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "cancel".tr,
            positiveText: "save".tr,
            onTapPositiveButton: controller.onClickSave,
          ),
        ),
      ),
    );
  }
}
