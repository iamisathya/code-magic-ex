import 'package:get/get.dart';

import '../ui/global/no_connection.dart';
import '../ui/screens/home/controller/home.controller.dart';
import '../ui/screens/inventory/inventory_home/controller/inventory.home.controller.dart';
import '../ui/screens/notifications/controller/notifications.controller.dart';
import '../ui/screens/open_po/order_create/controller/add.openpo.controller.dart';
import '../ui/screens/open_po/order_details/controller/openpo.details.controller.dart';
import '../ui/screens/open_po/order_list/controller/openpo.list.controller.dart';
import '../ui/screens/profile/profile.dart';
import '../ui/screens/profile/screens/change_password/controller/update_password.controller.dart';
import '../ui/screens/profile/screens/forgot_password/controller/forgot_password.controller.dart';
import '../ui/screens/profile/screens/forgot_password/screens/change_password/controller/change_password.controller.dart';
import '../ui/screens/profile/screens/forgot_password/screens/verify_code/controller/verify_code.controller.dart';
import '../ui/screens/profile/screens/terms_conditions/controller/terms_conditions.controller.dart';
import '../ui/screens/profile/screens/update_email/controller/update_email.controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(MemberCallsService(Dio()));
    // Get.put(OpenPoDetailsController(api: Get.find()));
    Get.lazyPut(() => OpenPoDetailsController(), fenix: true);
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}

class CreateOpenPoOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateOpenPoOrderController(), fenix: true);
  }
}

class OpenPoOrderListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenPoListController(), fenix: true);
  }
}

class InventoryBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<InventoryHomeController>(() => InventoryHomeController());
    Get.put<InventoryHomeController>(InventoryHomeController());
  }
}

class TermsConditionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TermsConditionsController>(TermsConditionsController());
  }
}

class UpdateEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UpdateEmailController>(UpdateEmailController());
  }
}

class UpdatePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UpdatePasswordController>(UpdatePasswordController());
  }
}

class UserProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserProfileController>(UserProfileController());
  }
}

class NotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NotificationsController>(NotificationsController());
  }
}

class NoConnectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NoConnectionController>(NoConnectionController());
  }
}

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}

class VerifyCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<VerifyCodeController>(VerifyCodeController());
  }
}

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
