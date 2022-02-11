import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../utils/images.dart';
import '../../../controllers/orderentry.product.list.controller.dart';

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
              children: controller.filterOptions
                  .map(
                    (i) => Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: GestureDetector(
                        onTap: () => controller.currentFilteredMethod = i.value,
                        child: AppText(
                            text: i.name.tr,
                            style: controller.filterMethod.value == i.value
                                ? TextTypes.subtitle1
                                : TextTypes.bodyText1),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          GestureDetector(
            onTap: () => controller.clearCart(clearOnly: true),
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
