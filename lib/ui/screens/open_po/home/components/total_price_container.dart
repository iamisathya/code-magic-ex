import 'package:flutter/material.dart';

import '../../../../../constants/globals.dart';

class TotalPrice extends StatelessWidget {
  final Color bgColor;
  final String totalPrice;
  final String totalPv;
  const TotalPrice(
      {this.bgColor = const Color(0xFFE3E8ED),
      required this.totalPrice,
      required this.totalPv});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total PV:",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: const Color(0xFF384250)),
                ),
                Text(
                  "$totalPv PV",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: const Color(0xFF384250)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
                color: Color(0xFFD0D0CF),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price:",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: const Color(0xFF384250)),
                ),
                Text(
                  "$totalPrice ${Globals.currency}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: const Color(0xFF384250)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
