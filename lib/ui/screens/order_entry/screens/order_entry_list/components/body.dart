import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/order_entry_list/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_tabs.dart';
import 'search_box.dart';
import 'top_header.dart';

class Body extends StatelessWidget {
  final OrderEntryProductListController controller = Get.put(OrderEntryProductListController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopHeader(),
          SearchBox(),
          FilterTabs(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 20, bottom: 20),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 3,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(100, (index) {
                return ProductItem();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
