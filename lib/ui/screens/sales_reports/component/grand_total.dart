import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

import '../../../../constants/globals.dart';

class GrandTotal extends StatelessWidget {
  final String totalPrice;
  final String totalPv;
  final String status;

  const GrandTotal(
      {required this.totalPrice, required this.totalPv, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
            color: status == "Unknown"
                ? AppColor.mistyRose
                : AppColor.bubbles, //FFE7EB error color
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                text: "Total Price:",
                style: TextTypes.bodyText2,
              ),
              AppText(
                  text: "$totalPrice ${Globals.currency}",
                  style: TextTypes.bodyText2),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
            color: status == "Unknown"
                ? AppColor.mistyRose
                : AppColor.bubbles, //FFE7EB error color
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(text: "Total PV:", style: TextTypes.bodyText2),
              AppText(text: "$totalPv PV", style: TextTypes.bodyText2),
            ],
          ),
        )
      ]),
    );
  }
}
