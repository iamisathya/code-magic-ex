import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:get/get.dart';

class EnrollCompleteController extends GetxController {
  EnrollForm enrollSuccessResponse = "";
  RxString orderId = "";

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      enrollSuccessResponse = data as EnrollForm;
      newUserId.value = enrollSuccessResponse.id.unicity.retrieveOrderId();
    }
  }

  void viewOrder() {
    final String hrefCode = getUniqueId(enrollSuccessResponse.href);
    launchURL(
        "${Address.orderedItems}/$hrefCode&token=${UserSessionManager.shared.customerToken.token}");
  }
}
