import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/models/inventory_item_v2.dart';
import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:dsc_tools/ui/screens/inventory/inventory_home/widgets/grand_total_price.dart';
import 'package:dsc_tools/ui/screens/inventory/inventory_home/widgets/inventory_item.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/inventory.search.result.controller.dart';

class InventorySearchResult extends StatelessWidget {
  final InventorySearchResultController controller =
      Get.put(InventorySearchResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageTitle(title: "Search results for: ${"inventory".tr}"),
            Column(
              children: [
                Column(
                  children: [
                    GrandTotal(
                        totalPrice: controller.totalCartPrice.value.toString(),
                        totalPv: controller.totalCartPv.toString()),
                    Container(
                      color: AppColor.kWhiteColor,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.itemsFound.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final InventoryItem item =
                              controller.itemsFound[index];
                          return InventoryItemClass(item: item);
                        },
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
