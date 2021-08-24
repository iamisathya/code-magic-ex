import 'package:get/get.dart';

import '../../../../api/api_address.dart';
import '../../../../models/enroll_form.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/user_session.dart';

class EnrollCompleteController extends GetxController {
  late EnrollForm enrollSuccessResponse;
  RxString orderNumber = "".obs;
  RxString userId = "".obs;

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      enrollSuccessResponse = data as EnrollForm;
      orderNumber.value = enrollSuccessResponse.id.unicity.retrieveOrderId();
      userId.value = enrollSuccessResponse.customer.id.unicity;
    }
  }

  void viewOrder() {
    final String hrefCode = getUniqueId(enrollSuccessResponse.href);
    launchURL(
        "${Address.orderedItems}/$hrefCode&token=${UserSessionManager.shared.customerToken.token}");
  }
}
