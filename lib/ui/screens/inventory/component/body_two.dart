import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/ui/screens/inventory/component/table_view.dart';
import 'package:dsc_tools/ui/screens/inventory/controller/inventory.home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'grand_total_price.dart';
import 'inventory_item.dart';
import 'page_title.dart';
import 'tool_bar.dart';
import 'user_address.dart';

class Body2 extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
    final displaySize = Get.height - 420;
    return SingleChildScrollView(
      child: Column(
        children: [
          const PageTitle(title: "Inventory"),
          InventoryToolBar(),
          UserAddress(),
          const SizedBox(height: 10),
          Obx(() => Column(
                children: [
                  if (controller.currentViewType.value.value == "card")
                    Column(
                      children: [
                        GrandTotal(),
                        const SizedBox(height: 10),
                        Container(
                            color: const Color(0xFFFFFFFF),
                            child: controller
                                    .tempInventoryRecords.value.items.isEmpty
                                ? Container(
                                    height: displaySize,
                                    alignment: Alignment.center,
                                    child: const Text("No items found!"),
                                  )
                                : Obx(() => ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.tempInventoryRecords
                                        .value.items.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      final InventoryRecordItems item =
                                          controller.tempInventoryRecords.value
                                              .items[index];
                                      return InventoryItem(item: item);
                                    }))),
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
