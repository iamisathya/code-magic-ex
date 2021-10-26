import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.summary.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../orderentry.screen.dart';
import 'components/body.dart';

class OrderEntrySummary extends StatelessWidget {
  static const String routeName = '/orderEntrySummaryPage';
  final OrderEntryCheckoutSummaryController controller =
      Get.put(OrderEntryCheckoutSummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E8ED),
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
              color: const Color(0xFFFFFFFF),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(title: "back".tr, 
                        onTap: controller.onNegetiveButtonClick),
                  ),
                  Flexible(
                    child: listController.cartProducts.isEmpty
                        ? NuetralButton(title: "Place Order".tr, onTap: controller.onClickNuetralButton)
                        : PositiveButton(title: "Place Order".tr, 
                            onTap: controller.proceedToCheckOut),
                  ),
                ],
              ),
            ),
    );
  }
}
