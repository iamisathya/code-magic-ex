import 'package:dsc_tools/navigation/router.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void onPressUpdateEmail() {
    Get.toNamed(ScreenPaths.updateEmail);
  }

  void onPressUpdatePassword() {
    Get.toNamed(ScreenPaths.updatePassword);
  }
}
