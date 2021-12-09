import 'package:dsc_tools/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/extensions.dart';
import '../../../../../global/theme/text_view.dart';
import '../../../controllers/orderentry.product.list.controller.dart';

class TotalAmountBox extends StatelessWidget {
  final OrderEntryProductListController listController =
      Get.put(OrderEntryProductListController());
  TotalAmountBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      height: 120,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: "${"total_pv".tr}:", style: TextTypes.bodyText2),
                Obx(() => AppText(
                    text: "${listController.totalCartPv} PV",
                    style: TextTypes.bodyText2))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: "${"total_price".tr}:", style: TextTypes.bodyText2),
                Obx(() => AppText(
                    text: "${listController.totalCartPrice.numberFormat()} ${Globals.currency}",
                    style: TextTypes.bodyText2))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: AppColor.manatee),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "payment_amount".tr, style: TextTypes.subtitle1),
              Obx(() => AppText(
                  text: "${listController.totalCartPrice.numberFormat()} ${Globals.currency}",
                  style: TextTypes.subtitle1))
            ],
          ),
        ],
      ),
    );
  }
}
