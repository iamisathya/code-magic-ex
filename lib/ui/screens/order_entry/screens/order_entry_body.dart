import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderEntryBody extends StatelessWidget {
  final OrderEntryTableController controller = Get.put(OrderEntryTableController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Get.arguments.toString()),
    );
  }
}