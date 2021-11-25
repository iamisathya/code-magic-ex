import 'package:dsc_tools/styles/border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../models/inventory_records.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';
import '../../../controllers/orderentry.product.list.controller.dart';

class ProductItem extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());
  final InventoryRecordItems item;
  final bool inCart;
  final int cartItemIndex;

  ProductItem(
      {required this.item, required this.inCart, required this.cartItemIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.addItemToCart(itemCode: item.item.id.unicity),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
          side: BorderSide(color: AppColor.sunglow, width: inCart ? 1 : 0),
        ),
        child: Stack(children: [
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(
                  text: "Code: ${item.item.id.unicity}",
                  style: TextTypes.caption,
                  color: AppColor.metallicSilver,
                ),
                const SizedBox(
                  height: 60,
                  child: FlutterLogo(size: 60),
                ),
                AppText(
                  align: TextAlign.center,
                  text: "${item.terms.pvEach} PV | ${item.terms.priceEach} THB",
                  style: TextTypes.caption,
                  color: AppColor.charcoal,
                ),
              ],
            ),
          ),
          if (inCart)
            Positioned(
              left: 10,
              top: 25,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: borderRadiusWithColor(bgColor: AppColor.sunglow),
                child: AppText(
                  text: cartItemIndex.toString(),
                  style: TextTypes.caption,
                  color: Colors.white,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
