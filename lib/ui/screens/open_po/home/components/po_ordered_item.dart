import 'package:flutter/material.dart';

import '../../../../../constants/globals.dart';
import '../../../../../models/open_po_details.dart';

class PoOrderedItem extends StatelessWidget {
  final OpenPlaceOrderDetails item;
  const PoOrderedItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xFFF1FAF7),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 40,
                    child: const Center(
                        child: Text(
                      "Item 02",
                      style: TextStyle(color: Color(0xFF384250), fontSize: 14),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 40,
                    child: Center(
                        child: Text(
                      item.productId,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: const Color(0xFF384250)),
                    )),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                        child: Text(
                      item.productName,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: const Color(0xFF384250)),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                        child: Text(
                      "${item.productPv} PV | ${item.productPrice} ${Globals.currency}",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: const Color(0xFF384250)),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 40,
                    child: Center(
                        child: Text(
                      item.productQty,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: const Color(0xFF384250)),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
