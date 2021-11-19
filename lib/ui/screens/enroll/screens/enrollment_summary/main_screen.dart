import '../../../open_po/home/components/app_bar.dart';
import '../../../open_po/home/components/loader.dart';
import '../../../../../utilities/constants.dart';
import 'package:flutter/material.dart';
import '../../../../global/widgets/bottom_button_bar.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'components/body.dart';
import 'controller/enrollment.summary.controller.dart';

class EnrollmentSummaryScreen extends StatelessWidget {
  final EnrollmentSummaryController controller =
      Get.put(EnrollmentSummaryController());
  static const String routeName = '/enrollmentSummaryHomePage';

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
            negetiveText: "Back",
            positiveText: "Proceed Payment",
            onTapPositiveButton: controller.onProceedPayment,
          ),
        ),
      ),
    );
  }
}
