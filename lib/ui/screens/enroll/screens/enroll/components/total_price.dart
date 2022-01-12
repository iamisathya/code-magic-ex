import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/globals.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';

class TotalPrice extends StatelessWidget {
  final Color bgColor;
  final String totalPrice;
  final String totalPv;
  const TotalPrice(
      {this.bgColor = AppColor.brightGray,
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
                AppText(text: "${"total_pv".tr}:", style: TextTypes.subtitle2),
                AppText(
                    text: "$totalPv ${"pv".tr}", style: TextTypes.subtitle2),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
                color: AppColor.kBlackColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                    text: "${"total_price".tr}:", style: TextTypes.subtitle2),
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
