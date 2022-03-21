import 'package:dsc_tools/modules/home/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/colors.dart';
import '../../../../data/model/inventory_item_v2.dart';
import '../../../../widgets/page_title.dart';
import '../controller/inventory.home.controller.dart';
import 'grand_total_price.dart';
import 'inventory_item.dart';
import 'table_view.dart';
import 'tool_bar.dart';
import 'user_address.dart';

class Body extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    const double _crossAxisSpacing = 8;
    final double _aspectRatio = _homeController.isMobileLayout ? 1.12 : 1.2;
    final int _crossAxisCount = _homeController.isMobileLayout ? 1 : 2;
    final displaySize = Get.height - 420;
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(title: "inventory".tr),
          InventoryToolBar(
              onTapExport: () => controller.onTapExportExcellSheet(),
              onTapPrint: () => controller.onTapPrint()),
          UserAddress(),
          Obx(() => Column(
                children: [
                  if (controller.inventoryItems.isNotEmpty)
                    GrandTotal(
                        totalPrice: controller.grandTotalPrice.value,
                        totalPv: controller.grandTotalPv.value),
                  if (controller.activeViewType == "card")
                    Column(
                      children: [
                        Container(
                          color: AppColor.kWhiteColor,
                          child: controller.inventoryItems.isEmpty
                              ? Container(
                                  height: displaySize,
                                  alignment: Alignment.center,
                                  child: Text("no_items_found".tr),
                                )
                              : Obx(
                                  () => GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: _crossAxisCount,
                                      crossAxisSpacing: _crossAxisSpacing,
                                      childAspectRatio: _aspectRatio,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.inventoryItems.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      final InventoryItem item =
                                          controller.inventoryItems[index];
                                      return InventoryItemClass(item: item);
                                    },
                                  ),
                                ),
                        ),
                      ],
                    )
                  else
                    SizedBox(height: Get.height - 420, child: TableView())
                ],
              ))
        ],
      ),
    );
  }
}
