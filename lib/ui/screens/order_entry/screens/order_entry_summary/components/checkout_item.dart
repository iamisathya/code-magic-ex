import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutItem extends StatelessWidget {
  final CartProductsItem item;

  const CheckoutItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: 61,
              height: 50,
              child: const FlutterLogo(size: 61),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppText(
                        text: item.productName, style: TextTypes.subtitle2),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                text: "CODE: ${item.itemCode}",
                                style: TextTypes.caption,
                                color: const Color(0xff9ea9b9)),
                            AppText(
                                text:
                                    "${item.totalPv} PV | ${item.totalPrice} THB",
                                style: TextTypes.bodyText2,
                                color: const Color(0xFF384250)),
                          ],
                        ),
                        QuantityCounter(item: item)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

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
          GestureDetector(onTap: () => listController.updateQuantity(CartUpdate.decreament, item.itemCode), child: const AppText(text: "-", style: TextTypes.headline4)),
          Container(
            width: 34,
            alignment: Alignment.center,
            child: AppText(
                text: item.quantity.toString(), style: TextTypes.bodyText1),
          ),
          GestureDetector(onTap: () => listController.updateQuantity(CartUpdate.increament, item.itemCode), child: const AppText(text: "+", style: TextTypes.headline4)),
        ],
      ),
    );
  }
}
