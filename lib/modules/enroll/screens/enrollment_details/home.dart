import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../widgets/bottom_button_bar.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import '../../../open_po/order_create/component/loader.dart';
import 'components/body.dart';
import 'controller/enrollement.details.controller.dart';

class EnrollmentDetailsHomeScreen extends StatelessWidget {
  final EnrollmentDetailsHomeController controller =
      Get.put(EnrollmentDetailsHomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: OpenPoAppBar(),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Body(),
          ),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: () => Get.back(),
            negetiveText: "back".tr,
            positiveText: "verify".tr,
            onTapPositiveButton: controller.verifyUserInfo,
          ),
        ),
      ),
    );
  }
}
