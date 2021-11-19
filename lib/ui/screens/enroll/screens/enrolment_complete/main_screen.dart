import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../open_po/home/components/app_bar.dart';
import '../../../open_po/home/components/loader.dart';
import 'components/body.dart';
import 'controller/enrolment_complete_controller.dart';

class EnrollmentCompleteScreen extends StatelessWidget {
  final EnrolmentCompleteController controller =
      Get.put(EnrolmentCompleteController());
  static const String routeName = '/enrollmentCompleteHomePage';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: OpenPoAppBar(),
          body: Body(),
        ),
      ),
    );
  }
}
