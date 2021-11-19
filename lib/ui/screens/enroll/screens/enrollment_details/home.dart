import '../../../../global/widgets/bottom_button_bar.dart';
import '../enrollment_user_info/main_screen.dart';
import '../../../open_po/home/components/app_bar.dart';
import '../../../open_po/home/components/loader.dart';
import '../../../../../utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'components/body.dart';
import 'controller/enrollement.details.controller.dart';

class EnrollmentDetailsHomeScreen extends StatelessWidget {
  final EnrollmentDetailsHomeController controller =
      Get.put(EnrollmentDetailsHomeController());
  static const String routeName = '/enrollmentDetailsHomePage';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: OpenPoAppBar(),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Body(),
          ),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: () => Get.back(),
            negetiveText: "Back",
            positiveText: "Verify",
            onTapPositiveButton: controller.verifyUserInfo,
          ),
        ),
      ),
    );
  }
}
