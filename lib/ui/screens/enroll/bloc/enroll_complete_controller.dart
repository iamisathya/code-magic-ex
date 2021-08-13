import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:get/get.dart';

class EnrollCompleteController extends GetxController {
  String newUserHrefCode = "";

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      newUserHrefCode = data as String;
    }
  }

  void viewOrder() {
    launchURL(
        "${Address.orderedItems}/$newUserHrefCode&token=${UserSessionManager.shared.customerToken.token}");
  }
}
