import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:get/get.dart';

class EnrollCompleteController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      // orderResponse = data as PlaceOrder;
    }
  }

  void viewOrder() {
    launchURL(
        "${Address.orderedItems}/31512d2a1d4a2a5860bc785d27d1f7526abc4ab374da39eaf85def23ee2db594&token=${UserSessionManager.shared.customerToken.token}");
  }
}
