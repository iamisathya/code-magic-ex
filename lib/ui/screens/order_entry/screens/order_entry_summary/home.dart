import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../constants/colors.dart';
import '../../../open_po/order_create/component/app_bar.dart';
import '../../../open_po/order_create/component/loader.dart';
import '../../controllers/orderentry.product.list.controller.dart';
import '../../controllers/orderentry.summary.controller.dart';
import '../../orderentry.screen.dart';
import 'components/body.dart';

class OrderEntrySummary extends StatelessWidget {
  static const String routeName = '/orderEntrySummaryPage';
  final OrderEntryCheckoutSummaryController controller =
      Get.put(OrderEntryCheckoutSummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.brightGray,
      appBar: OpenPoAppBar(),
      body: Obx(
        () => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: const Loader(),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Body(),
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonBar(controller: controller),
    );
  }
}

class BottomButtonBar extends StatelessWidget {
  final OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());

  BottomButtonBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OrderEntryCheckoutSummaryController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const SizedBox()
          : Container(
              height: 90,
              color: AppColor.kWhiteColor,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(
                        title: "back".tr,
                        onTap: controller.onNegetiveButtonClick),
                  ),
                  Flexible(
                    child: listController.cartProducts.isEmpty
                        ? NuetralButton(
                            title: "place_order".tr,
                            onTap: controller.onClickNuetralButton)
                        : PositiveButton(
                            title: "place_order".tr,
                            onTap: controller.proceedToCheckOut),
                  ),
                ],
              ),
            ),
    );
  }
}
