import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GrandTotal extends StatelessWidget {
  final String totalPrice;
  final String totalPv;

  const GrandTotal({required this.totalPrice, required this.totalPv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: AppColor.crayola,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: AppColor.bubbles, borderRadius: BorderRadius.circular(10)),
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                    text: "${"total_price".tr}:",
                    style: TextTypes.bodyText1),
                AppText(
                    text: "${totalPrice.format()} ${Globals.currency}",
                    style: TextTypes.bodyText1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                    text: "${"total_pv".tr}:",
                    style: TextTypes.bodyText1),
                AppText(
                    text: "${totalPv.format()} ${"pv".tr}", style: TextTypes.bodyText1),
              ],
            )
          ],
        ),
      ),
    );
  }
}
