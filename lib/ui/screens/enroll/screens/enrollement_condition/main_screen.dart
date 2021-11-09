import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:dsc_tools/ui/global/widgets/bottom_button_bar.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'components/body.dart';
import 'controller/enrollment.terms.controller.dart';

class EnrollmentTermsScreen extends StatelessWidget {
  final EnrollmentTermsController controller =
      Get.put(EnrollmentTermsController());
  static const String routeName = '/enrollmentTermsHomePage';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: const Body(),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: Get.back,
            negetiveText: "Back",
            positiveText: "OK, Got it",
            onTapPositiveButton: Get.back,
          ),
        ),
      ),
    );
  }
}
