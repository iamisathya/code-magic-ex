import 'error_screen.dart';
import 'success_screen.dart';
import '../controller/enrolment_complete_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final EnrolmentCompleteController controller =
      Get.put(EnrolmentCompleteController());

  @override
  Widget build(BuildContext context) {
    return controller.isEnrolementSuccess.value
        ? const EnrolmentSuccessScreen()
        : EnrolmentErrorScreen();
  }
}
