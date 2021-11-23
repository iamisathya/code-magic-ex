import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                    text: "${"total_pv".tr}:",
                    style: TextTypes.subtitle2,
                    color: const Color(0xFF384250)),
                AppText(
                    text: "$totalPv PV",
                    style: TextTypes.subtitle2,
                    color: const Color(0xFF384250)),
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
                AppText(
                    text: "${"total_price".tr}:",
                    style: TextTypes.subtitle2,
                    color: const Color(0xFF384250)),
                AppText(
                    text: "$totalPrice ${Globals.currency}",
                    style: TextTypes.subtitle2,
                    color: const Color(0xFF384250)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
