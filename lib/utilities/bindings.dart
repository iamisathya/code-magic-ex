import 'package:get/get.dart';

import '../ui/screens/open_po/controller/add.openpo.controller.dart';
import '../ui/screens/open_po/controller/openpo.details.controller.dart';
import '../ui/screens/open_po/controller/openpo.list.controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(MemberCallsService(Dio()));
    // Get.put(OpenPoDetailsController(api: Get.find()));
    Get.lazyPut(() => OpenPoDetailsController(), fenix: true);
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
