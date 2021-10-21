import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterTabs extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());

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
                    onTap: () => controller
                        .onTabChange(OrderEntryItemFilters.allProduct),
                    child: AppText(
                        text: "All Product",
                        style: controller.filterMethod.value == "all"
                            ? TextTypes.subtitle1
                            : TextTypes.bodyText1)),
                const SizedBox(width: 30),
                GestureDetector(
                    onTap: () => controller
                        .onTabChange(OrderEntryItemFilters.easyShipSet),
                    child: AppText(
                        text: "Easyship Set",
                        style: controller.filterMethod.value == "easyShip"
                            ? TextTypes.subtitle1
                            : TextTypes.bodyText1)),
              ],
            ),
          ),
          GestureDetector(
            onTap: controller.clearCart,
            child: SvgPicture.asset(
              kTrashIcon,
              width: 20,
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
