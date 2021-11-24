import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utilities/constants.dart';
import '../../home/components/bottom_navigation_bar.dart';
import '../../home/controller/home.controller.dart';
import '../controller/openpo.list.controller.dart';
import '../order_list/components/open_po_order_list.dart';

class OpenPoHomeScreen extends StatelessWidget {
  static const String routeName = '/openPoHomePage';

  final HomeController tabController = Get.put(HomeController());
  final OpenPoListController listController = Get.put(OpenPoListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: listController.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: OpenPoOrderList(),
          bottomNavigationBar: NavigationBottomBar(
              controller: tabController,
              isExternal: true,
              currentPage: "/openPoCreateOrder"),
        ),
      ),
    );
  }
}
