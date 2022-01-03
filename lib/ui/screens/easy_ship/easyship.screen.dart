import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../utilities/constants.dart';
import '../open_po/order_create/component/app_bar.dart';
import '../open_po/order_create/component/loader.dart';
import 'components/body2.dart';
import 'controller/easyshiphome.controller.dart';

class EasyShipHomeScreen extends StatelessWidget {
  final EasyShipHomeController controller = Get.put(EasyShipHomeController());
  static const String routeName = '/easyShipReportsHomePage';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Body()),
        ),
      ),
    );
  }
}
