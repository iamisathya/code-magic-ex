import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../core/values/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/bottom_button_bar.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import '../../../open_po/order_create/component/loader.dart';
import 'components/body.dart';
import 'controller/enrollment.userinfo.controller.dart';

class EnrollmentUserInfoScreen extends StatelessWidget {
  final EnrollmentUserInfoController controller =
      Get.put(EnrollmentUserInfoController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "back".tr,
            positiveText: "continue".tr,
            onTapPositiveButton: controller.verifyEnrollForm,
          ),
          floatingActionButton: AnimatedOpacity(
            opacity: controller.isScrolButtonVisible.value ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: FloatingActionButton(
              backgroundColor: AppColor.sunglow,
              onPressed: controller.onTapScrollToTop,
              tooltip: 'scroll to top',
              child: const Icon(
                Icons.arrow_upward,
                color: AppColor.kBlackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
