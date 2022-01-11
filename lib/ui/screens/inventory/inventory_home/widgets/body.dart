import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/models/inventory_item_v2.dart';
import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:dsc_tools/ui/screens/inventory/inventory_home/widgets/table_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/inventory.home.controller.dart';
import 'grand_total_price.dart';
import 'inventory_item.dart';
import 'tool_bar.dart';
import 'user_address.dart';

class Body extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
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
                                  () => ListView.builder(
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
