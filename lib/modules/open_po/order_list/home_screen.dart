import 'package:dsc_tools/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../core/values/colors.dart';
import '../../../utils/constants.dart';
import '../order_create/component/app_bar.dart';
import '../order_create/component/loader.dart';
import '../order_list/components/open_po_order_list.dart';
import 'controller/openpo.list.controller.dart';

class OpenPoHomeScreen extends StatelessWidget {
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
            onPressed: () => Get.toNamed(Routes.OPEN_PO_CREATE_ORDER),
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
