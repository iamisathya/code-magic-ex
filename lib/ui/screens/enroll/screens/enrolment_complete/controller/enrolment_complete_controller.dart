import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/general_models.dart';
import '../../../../home/home.dart';
import '../../../enrollhome.screen.dart';

class EnrolmentCompleteController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isEnrolementSuccess = false.obs;

  late OrderCompleteArguments orderDetails;

  @override
  void onInit() {
    super.onInit();
    try {
      final dynamic data = Get.arguments;
      if (data != null) {
        orderDetails = data as OrderCompleteArguments;
      } else {
        Get.back();
      }
    } catch (e) {
      orderDetails =
          OrderCompleteArguments(orderId: "", orderStatus: false, userId: "");
      debugPrint(e.toString());
    }
  }

  void onClickTryAgain() {
    Get.to(MainHomeScreen());
    Get.to(EnrollHomeScreen());
  }
}
