import 'package:get/get.dart';

import '../../../../data/model/openpo_create_order_result.dart';
import '../../../home/home.dart';
import '../../order_list/controller/openpo.list.controller.dart';
import '../../order_list/home_screen.dart';

class OpenPoOrderResultController extends GetxController {
  final OpenPoListController homeCtrol = Get.put(OpenPoListController());

  late OpenPoCreateOrderResult result;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      result = data as OpenPoCreateOrderResult;
    } else {
      Get.back();
    }
    super.onInit();
  }

  void onPressedBack() {
    homeCtrol.getAllOpenPo();
    Get.off(() => OpenPoHomeScreen());
  }

  void gotoHome() {
    Get.offAll(() => MainHomeScreen());
  }
}
