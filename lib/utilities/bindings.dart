import 'package:dio/dio.dart';
import 'package:dsc_tools/api/config/api_service.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/add.openpo.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/openpo.details.controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(MemberCallsService(Dio()));
    // Get.put(OpenPoDetailsController(api: Get.find()));
    Get.lazyPut(() => OpenPoDetailsController(api: MemberCallsService(Dio())), fenix: true);
  }
}

class CreateOpenPoOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateOpenPoOrderController(), fenix: true);
  }
}
