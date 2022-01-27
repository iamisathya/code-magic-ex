import 'package:dsc_tools/ui/screens/home/controller/home.controller.dart';
import 'package:dsc_tools/ui/screens/profile/screens/change_password/controller/update_password.controller.dart';
import 'package:dsc_tools/ui/screens/profile/screens/terms_conditions/controller/terms_conditions.controller.dart';
import 'package:dsc_tools/ui/screens/profile/screens/update_email/controller/update_email.controller.dart';
import 'package:get/get.dart';

import '../ui/screens/inventory/inventory_home/controller/inventory.home.controller.dart';
import '../ui/screens/open_po/order_create/controller/add.openpo.controller.dart';
import '../ui/screens/open_po/order_details/controller/openpo.details.controller.dart';
import '../ui/screens/open_po/order_list/controller/openpo.list.controller.dart';

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
