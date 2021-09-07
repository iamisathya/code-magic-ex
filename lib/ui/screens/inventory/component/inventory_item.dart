import 'package:dsc_tools/models/inventory_records.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/parsing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class InventoryItem extends StatelessWidget {
  final InventoryRecordItems item;
  const InventoryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final double totalPrice = Parsing.intFrom(item.quantityOnHand)! * item.terms.priceEach;
    final String totalPriceString = NumberFormat().format(totalPrice.toInt());
    final int totalPv = Parsing.intFrom(item.quantityOnHand)! * item.terms.pvEach;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 340,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Color(0xFFF1FAF7),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(item.catalogSlideContent.content.description,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: const Color(0xFF000000))),
          ),
          Container(
            color: const Color(0xFFFFFFFF),
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
                      border: Border.all(color: const Color(0xFFFFB74F))),
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
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${item.terms.pvEach} PV | ${NumberFormat().format(item.terms.priceEach.toInt())} THB"),
                Text("Item Code: ${item.item.id.unicity}"),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Price:"),
                Text("$totalPriceString THB"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total PV:"),
              Text("$totalPv PV"),
            ],
          )
        ],
      ),
    );
  }
}
