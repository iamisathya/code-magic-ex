import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityCounter extends StatelessWidget {
  final OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());

  final CartProductsItem item;

  QuantityCounter({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: const Color(0xffd0d0cf),
          width: 0.50,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: () => listController.updateQuantity(
                  CartUpdate.decreament, item.itemCode),
              child: const AppText(text: "-", style: TextTypes.headline4)),
          Container(
            width: 34,
            alignment: Alignment.center,
            child: AppText(
                text: item.quantity.toString(), style: TextTypes.bodyText1),
          ),
          GestureDetector(
              onTap: () => listController.updateQuantity(
                  CartUpdate.increament, item.itemCode),
              child: const AppText(text: "+", style: TextTypes.headline4)),
        ],
      ),
    );
  }
}
