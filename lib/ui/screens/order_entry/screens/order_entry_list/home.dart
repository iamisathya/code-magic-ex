import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../open_po/home/components/app_bar.dart';
import '../../../open_po/home/components/loader.dart';
import '../../controllers/orderentry.product.list.controller.dart';
import '../../orderentry.screen.dart';
import 'components/body.dart';

class OrderEntryList extends StatelessWidget {
  static const String routeName = '/orderEntryProductListPage';
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());
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
        bottomNavigationBar: BottomButtonBar(controller: controller));
  }
}

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OrderEntryProductListController controller;

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
                    child: NegetiveButton(title: "cancel".tr, onTap: controller.onCancel),
                  ),
                  Flexible(
                    child: controller.cartProducts.isEmpty
                        ? NuetralButton(title: "next".tr, onTap: controller.onClickNuetralButton)
                        : PositiveButton(title: "next".tr, 
                            onTap: controller.onClickPositiveButton),
                  ),
                ],
              ),
            ),
    );
  }
}
