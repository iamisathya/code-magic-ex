import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.summary.controller%20copy.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterTabs extends StatelessWidget {
  final OrderEntryCheckoutSummaryController controller =
      Get.put(OrderEntryCheckoutSummaryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Row(
              children: [
                GestureDetector(
                    onTap: () =>
                        controller.onTabChange(OrderEntrySummaryFilters.myCart),
                    child: AppText(
                      text: "My Cart",
                      style: controller.filterMethod.value == "myCart"
                          ? TextTypes.subtitle1
                          : TextTypes.bodyText1,
                      color: const Color(0xFF505050),
                    )),
                const SizedBox(width: 30),
                GestureDetector(
                    onTap: () => controller
                        .onTabChange(OrderEntrySummaryFilters.paymentType),
                    child: AppText(
                      text: "Payment Type",
                      style: controller.filterMethod.value == "paymentType"
                          ? TextTypes.subtitle1
                          : TextTypes.bodyText1,
                      color: const Color(0xFF505050),
                    )),
              ],
            ),
          ),
          SvgPicture.asset(
            kTrashIcon,
            width: 20,
            height: 20,
          )
        ],
      ),
    );
  }
}
