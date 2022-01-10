import 'package:dsc_tools/models/inventory_item_v2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../open_po/order_create/component/app_bar.dart';
import '../controller/inventory.search.result.controller.dart';
import 'grand_total_price.dart';
import 'inventory_item.dart';
import 'page_title.dart';
import 'tool_bar.dart';

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
            PageTitle(title: "inventory".tr),
            InventoryToolBar(
                onTapExport: () => (){},
                onTapPrint: () => (){},
                hideSearch: true),
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
                          final InventoryItem item = controller.itemsFound[index];
                          return InventoryItemClass(item: item);
                          // return Center();
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
