import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../utilities/constants.dart';
import '../../global/widgets/bottom_button_bar.dart';
import '../open_po/home/components/app_bar.dart';
import '../open_po/home/components/loader.dart';
import 'controllers/enroll.controller.dart';
import 'screens/enroll/body2.dart';

class EnrollHomeScreen extends StatelessWidget {
  final EnrollHomeController controller = Get.put(EnrollHomeController());
  static const String routeName = '/enrollHomePage';

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
            child: Body(),
          ),
          bottomNavigationBar: BottomButtonBar(
            showNeutral: false,
            onTapCancelButton: () => controller.showBottomModal(context),
            negetiveText: "+ Add",
            positiveText: "Continue",
            onTapPositiveButton: controller.onContinue,
          ),
        ),
      ),
    );
  }
}
