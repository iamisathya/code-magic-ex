import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/constants.dart';
import '../order_create/component/app_bar.dart';
import '../order_create/component/loader.dart';
import '../order_create/home_screen.dart';
import '../order_list/components/open_po_order_list.dart';
import 'controller/openpo.list.controller.dart';

class OpenPoHomeScreen extends StatelessWidget {
  static const String routeName = '/openPoHomePage';
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.crayola,
            onPressed: () => Get.to(() => OpenPoCreateOrder()),
            tooltip: 'scroll to top',
            child: const Icon(
              Icons.add,
              color: AppColor.kBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}
