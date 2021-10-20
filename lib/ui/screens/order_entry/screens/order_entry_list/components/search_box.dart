import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/ui/screens/order_entry/screens/home/components/white_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(20),
      color: const Color(0xff76e5de),
      child: WhiteSearchField(
          controller: controller.searchUserTextController,
          onPress: controller.onSearchPressed,
          hintText: "Search products"),
    );
  }
}
