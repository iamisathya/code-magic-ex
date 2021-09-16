import '../controller/inventory.search.result.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../open_po/home/components/app_bar.dart';
import 'grand_total_price.dart';
import 'inventory_item.dart';
import 'page_title.dart';
import 'tool_bar.dart';
import '../../../../utilities/extensions.dart';

class InventorySearchResult extends StatelessWidget {
  final InventorySearchResultController controller =
      Get.put(InventorySearchResultController());

  @override
  Widget build(BuildContext context) {
    final totalPrice = controller.itemFound.quantityOnHand.toInt() *
        controller.itemFound.terms.priceEach.toInt();
    final totalPv =
        controller.itemFound.quantityOnHand.toInt() * controller.itemFound.terms.pvEach;
    return Scaffold(
      appBar: OpenPoAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageTitle(title: "Inventory"),
            InventoryToolBar(onTapExport: () => null, onTapPrint: () => null, hideSearch: true),
            Container(height: 10, color: const Color(0xFFCBCBCD)),
            Column(
              children: [
                Column(
                  children: [
                    GrandTotal(totalPrice: totalPrice.toString(), totalPv: totalPv.toString()),
                    Container(
                      color: const Color(0xFFFFFFFF),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return InventoryItem(item: controller.itemFound);
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
