import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/inventory_records.dart';
import '../../../../utilities/images.dart';
import '../../../../utilities/parsing.dart';
import '../controller/inventory.home.controller.dart';

class InventoryItem extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());
  final InventoryRecordItems item;
  InventoryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final double totalPrice =
        Parsing.intFrom(item.quantityOnHand)! * item.terms.priceEach;
    final String totalPriceString = NumberFormat().format(totalPrice.toInt());
    final int totalPv =
        Parsing.intFrom(item.quantityOnHand)! * item.terms.pvEach;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 340,
      decoration: BoxDecoration(
          color: controller.activeStockType.value.value == "onHand"
              ? const Color(0xFFF1FAF7)
              : const Color(0xFFF7F1E9),
          borderRadius: const BorderRadius.all(Radius.circular(3.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(item.catalogSlideContent.content.description,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: const Color(0xFF000000))),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color(0xFFFFFFFF)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(kPrintIcon,
                      height: 125, semanticsLabel: 'print icon'),
                ),
                Container(
                  height: 105,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFFB74F)),
                      borderRadius: BorderRadius.circular(2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Quantity on hand",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: const Color(0xFF9EA9B9)),
                        ),
                      ),
                      Text(
                        item.quantityOnHand,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: const Color(0xFF6FCF97)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${item.terms.pvEach} PV | ${NumberFormat().format(item.terms.priceEach.toInt())} THB",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: const Color(0xFF000000))),
                      Text("Item Code: ${item.item.id.unicity}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: const Color(0xFF000000))),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                    height: 1,
                    color: Color(0xFFE3E8ED),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: const Color(0xFF606975))),
                    Text("$totalPriceString THB",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: const Color(0xFF606975))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total PV:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: const Color(0xFF606975))),
                    Text("$totalPv PV",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: const Color(0xFF606975))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
