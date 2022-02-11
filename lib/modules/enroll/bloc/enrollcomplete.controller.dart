import 'package:get/get.dart';

import '../../../core/values/endpoints.dart';
import '../../../data/model/enroll_form.dart';
import '../../../utils/extensions.dart';
import '../../../utils/function.dart';
import '../../../utils/user_session.dart';

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
        "${Endpoints.orderedItems}/$hrefCode&token=${UserSessionManager.shared.customerToken.token}");
  }
}
