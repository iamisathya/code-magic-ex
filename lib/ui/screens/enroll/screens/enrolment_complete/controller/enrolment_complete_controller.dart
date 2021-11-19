import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:dsc_tools/models/general_models.dart';

class EnrolmentCompleteController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isEnrolementSuccess = false.obs;

  late OrderCompleteArguments orderDetails;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      orderDetails = data as OrderCompleteArguments;
    } else {
      Get.back();
    }
    super.onInit();
  }


}
