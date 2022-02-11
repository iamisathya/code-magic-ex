import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../widgets/bottom_button_bar.dart';
import '../../open_po/order_create/component/app_bar.dart';
import '../../open_po/order_create/component/loader.dart';
import 'controller/forgot_password.controller.dart';
import 'widgets/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  ForgotPasswordScreen({Key? key}) : super(key: key);

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
            positiveText: "send_reset_link".tr,
            onTapPositiveButton: controller.sendResetLink,
          ),
        ),
      ),
    );
  }
}
