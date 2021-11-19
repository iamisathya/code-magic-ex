import '../../../../../../models/inventory_records.dart';
import '../../../../../global/theme/text_view.dart';
import '../../../controllers/orderentry.product.list.controller.dart';
import '../../../../../../utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());
  final InventoryRecordItems item;
  final bool inCart;
  final int cartItemIndex;

  ProductItem({required this.item, required this.inCart, required this.cartItemIndex});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.addItemToCart(itemCode: item.item.id.unicity),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
          side: BorderSide(
            color: const Color(0xFFFFBF3A),
            width: inCart ? 1 : 0
          ),
        ),
        child: Stack(children: [
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(
                  text: "Code: ${item.item.id.unicity}",
                  style: TextTypes.caption,
                  color: const Color(0xFF9EA9B9),
                ),
                const SizedBox(
                  height: 60,
                  child: FlutterLogo(size: 60),
                ),
                AppText(
                  align: TextAlign.center,
                  text: "${item.terms.pvEach} PV | ${item.terms.priceEach} THB",
                  style: TextTypes.caption,
                  color: const Color(0xFF384250),
                ),
              ],
            ),
          ),
          if(inCart) Positioned(
            left: 10,
            top: 25,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFBF3A),
                  borderRadius: BorderRadius.circular(3)),
              child: AppText(text: cartItemIndex.toString(), style: TextTypes.caption, color: Colors.white,),
            ),
          )
        ]),
      ),
    );
  }
}
