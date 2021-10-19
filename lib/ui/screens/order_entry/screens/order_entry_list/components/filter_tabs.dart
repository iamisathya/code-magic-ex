import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/order_entry/controllers/orderentry.product.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterTabs extends StatelessWidget {
  final OrderEntryProductListController controller = Get.put(OrderEntryProductListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AppText(text: "All Product", style: controller. TextTypes.bodyText1),
              const SizedBox(width: 30),
              const AppText(text: "Easyship Set", style: TextTypes.bodyText1),
            ],),
            SvgPicture.asset(kTrashIcon, width: 20, height: 20,)
      ],),
    );
  }
}