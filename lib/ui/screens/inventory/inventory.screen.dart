import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../../utilities/constants.dart';
import 'component/body_two.dart';
import 'controller/inventory.home.controller.dart';

class InventoryHomeScreen extends StatelessWidget {
  static const String routeName = '/inventoryHomePage';
  final InventoryHomeController controller =
      Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            progressIndicator: const Loader(),
            child: Body2())));
  }
}
