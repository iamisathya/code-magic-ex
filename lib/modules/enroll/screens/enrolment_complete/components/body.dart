import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/enrolment_complete_controller.dart';
import 'error_screen.dart';
import 'success_screen.dart';

class Body extends StatelessWidget {
  final EnrolmentCompleteController controller =
      Get.put(EnrolmentCompleteController());

  @override
  Widget build(BuildContext context) {
    return controller.orderDetails.orderStatus
        ? EnrolmentSuccessScreen(
            distributorId: controller.orderDetails.userId,
            poNumber: controller.orderDetails.orderId,
          )
        : EnrolmentErrorScreen();
  }
}
