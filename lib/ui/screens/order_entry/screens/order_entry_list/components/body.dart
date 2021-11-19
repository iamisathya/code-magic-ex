import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/inventory_records.dart';
import '../../../controllers/orderentry.product.list.controller.dart';
import 'filter_tabs.dart';
import 'product_item.dart';
import 'search_box.dart';
import 'top_header.dart';

class Body extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopHeader(),
          SearchBox(),
          FilterTabs(),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 20, bottom: 20),
            child: Obx(
              () => GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(
                    controller.currentFilteredMethod == "all"
                        ? controller.inventoryRecords.value.items.length
                        : controller.inventoryEasyShipRecords.value.items
                            .length, (index) {
                  final InventoryRecordItems item =
                      controller.currentFilteredMethod == "all"
                          ? controller.inventoryRecords.value.items[index]
                          : controller
                              .inventoryEasyShipRecords.value.items[index];
                  int itemIndex =
                      controller.cartItemIndex(item.item.id.unicity);
                  final bool inItemInCart =
                      itemIndex != -1; // id -1 means item not in cart
                  itemIndex = itemIndex +
                      1; // add 1 to index numbner which start from 0
                  return ProductItem(
                      item: item,
                      inCart: inItemInCart,
                      cartItemIndex: itemIndex);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
