import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../models/inventory_records.dart';
import '../controller/inventory.home.controller.dart';
import 'grand_total_price.dart';
import 'inventory_item.dart';
import 'page_title.dart';
import 'table_view.dart';
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
          PageTitle(title: "inventory".tr),
          InventoryToolBar(
              onTapExport: () => controller.onTapExportExcellSheet(),
              onTapPrint: () => controller.onTapPrint()),
          UserAddress(),
          Container(height: 10, color: AppColor.chineseSilver),
          Obx(() => Column(
                children: [
                  if (controller.currentViewType.value.value == "card")
                    Column(
                      children: [
                        GrandTotal(
                            totalPrice: controller.grandTotalPrice.value,
                            totalPv: controller.grandTotalPv.value),
                        Container(
                            color: AppColor.kWhiteColor,
                            child: controller
                                    .tempInventoryRecords.value.items.isEmpty
                                ? Container(
                                    height: displaySize,
                                    alignment: Alignment.center,
                                    child: Text("no_items_found!".tr),
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
