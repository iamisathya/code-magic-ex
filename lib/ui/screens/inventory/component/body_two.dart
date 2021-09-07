import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/ui/screens/inventory/controller/inventory.home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'grand_total_price.dart';
import 'inventory_item.dart';
import 'tool_bar.dart';
import 'user_address.dart';

class Body2 extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                  child: Text("Inventory",
                      style: Theme.of(context).textTheme.headline4)),
            ),
          ),
          InventoryToolBar(),
          UserAddress(),
          const SizedBox(height: 10),
          GrandTotal(),
          const SizedBox(height: 10),
          Obx(() => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.tempInventoryRecords.value.items.length,
              itemBuilder: (BuildContext ctxt, int index) {
                final InventoryRecordItems item =
                    controller.tempInventoryRecords.value.items[index];
                return InventoryItem(item: item);
              })),
        ],
      ),
    );
  }
}
