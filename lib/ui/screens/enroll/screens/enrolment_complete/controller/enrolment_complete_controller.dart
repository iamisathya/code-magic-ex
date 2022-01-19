import 'package:dsc_tools/services/rest_api/exceptions.dart';
import 'package:get/get.dart';

import '../../../../../../models/general_models.dart';

class EnrolmentCompleteController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isEnrolementSuccess = false.obs;

  late OrderCompleteArguments orderDetails = OrderCompleteArguments();

  bool get isSuccess => orderDetails.orderStatus;

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
    } on AppException catch (err, stack) {
      err.logError(err, stack);
    }
  }

  void onClickTryAgain() {
    Get.back();
  }
}
