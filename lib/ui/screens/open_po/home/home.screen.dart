import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utilities/constants.dart';
import '../../home/components/bottom_navigation_bar.dart';
import '../../home/controller/home.controller.dart';
import '../controller/openpo.list.controller.dart';
import 'components/app_bar.dart';
import 'components/loader.dart';
import 'components/open_po_order_list.dart';

class OpenPOHomeScreen extends StatelessWidget {
  static const String routeName = '/openPOHomePage';

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
              currentPage: "/createOpenPoOrder"),
        ),
      ),
    );
  }
}
