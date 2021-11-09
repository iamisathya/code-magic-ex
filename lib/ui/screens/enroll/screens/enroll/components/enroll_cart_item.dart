import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/global/widgets/cart_counter_view.dart';
import 'package:dsc_tools/ui/screens/enroll/controllers/enroll.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EnrollCartItem extends StatelessWidget {
  final EnrollHomeController controller = Get.put(EnrollHomeController());
  final CartProductsItem item;
  final int idx;

  EnrollCartItem({required this.item, required this.idx, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: const Color(0xFFFFFFFF),
      padding: const EdgeInsets.all(20),
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
              height: 158,
              width: 128,
              child: SvgPicture.asset(kProductPlaceholderImage,
                  height: 158, width: 128)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(
                  text: item.productName,
                  style: TextTypes.subtitle1,
                ),
                AppText(
                  text: "Code: ${item.itemCode}",
                  style: TextTypes.caption,
                  color: const Color(0xFF9EA9B9),
                ),
                AppText(
                  text: "${item.itemPv} PV | ${item.itemPrice} THB",
                  style: TextTypes.subtitle1,
                  color: const Color(0xFF384250),
                ),
                CartCounterView(
                    itemCode: item.itemCode,
                    onPress: controller.onUpdateQuantity,
                    quantity: item.quantity)
              ],
            ),
          )
        ],
      ),
    );
  }
}
