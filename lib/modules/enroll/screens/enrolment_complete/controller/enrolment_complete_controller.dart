import 'package:get/get.dart';

import '../../../../../data/model/general_models.dart';
import '../../../../../data/services/notifications.dart';
import '../../../../../helpers/exceptions.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../home/home.dart';

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
        _trackEvent();
      } else {
        Get.back();
      }
    } on AppException catch (err, stack) {
      err.logError(err, stack);
    }
  }

  void _trackEvent() {
    FirebaseService.trackEvent(name: 'enroll_status', params: {
      "user_id": orderDetails.userId,
      "order_id": orderDetails.orderId,
      "status": orderDetails.orderStatus
    });
  }

  void onClickTryAgain() {
    Get.back();
  }

  void onClickGoHome() {
    Get.offAll(() => MainHomeScreen());
  }

  void onClickBarcodeScan() {
    Get.offAll(() => MainHomeScreen());
    Get.toNamed(Routes.BARCODE, arguments: orderDetails.orderId);
    Get.toNamed(Routes.BARCODE_DETAILS, arguments: orderDetails.orderId);
  }
}
