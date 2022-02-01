import 'package:dsc_tools/services/firebase/notifications.dart';
import 'package:dsc_tools/services/rest_api/exceptions.dart';
import 'package:dsc_tools/ui/screens/barcode/barcode.screen.dart';
import 'package:dsc_tools/ui/screens/barcode/screens/barcode_details.dart';
import 'package:dsc_tools/ui/screens/home/home.dart';
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
    Get.to(() => BarcodeHomeScreen(), arguments: orderDetails.orderId);
    Get.to(() => BarCodeDetails(), arguments: orderDetails.orderId);
  }
}
