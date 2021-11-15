import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(text: "Total PV:", style: TextTypes.subtitle2),
                AppText(text: "$totalPv PV", style: TextTypes.subtitle2),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
                color: Color(0xFF000000),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(text: "Total Price:", style: TextTypes.subtitle2),
                AppText(
                    text: "$totalPrice ${Globals.currency}",
                    style: TextTypes.subtitle2),
              ],
            )
          ],
        ),
      ),
    );
  }
}
