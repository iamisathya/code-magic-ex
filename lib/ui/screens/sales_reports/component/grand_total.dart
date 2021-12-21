import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/globals.dart';
import '../../../../styles/border.dart';
import '../../../../utilities/enums.dart';
import '../../../global/theme/text_view.dart';

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
      decoration: kOnlyBorderRadius,
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
              AppText(
                text: "${"total_price".tr}:",
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
              AppText(text: "${"total_pv".tr}:", style: TextTypes.bodyText2),
              AppText(text: "$totalPv ${"pv".tr}", style: TextTypes.bodyText2),
            ],
          ),
        )
      ]),
    );
  }
}
