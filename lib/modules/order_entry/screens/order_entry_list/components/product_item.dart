import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../data/provider/globals.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/styles/border.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../data/model/inventory_item_v2.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/images.dart';
import '../../../controllers/orderentry.product.list.controller.dart';

class ProductItem extends StatelessWidget {
  final OrderEntryProductListController controller =
      Get.put(OrderEntryProductListController());
  final InventoryItem item;
  final bool inCart;
  final int cartItemIndex;

  ProductItem(
      {required this.item, required this.inCart, required this.cartItemIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.addItemToCart(itemCode: item.item!.id!.unicity!),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
          side: BorderSide(
              color: AppColor.sunglow,
              style: inCart ? BorderStyle.solid : BorderStyle.none),
        ),
        child: Stack(children: [
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(
                  text: "${"code".tr}: ${item.item!.id!.unicity}",
                  style: TextTypes.caption,
                  color: AppColor.metallicSilver,
                ),
                SizedBox(
                  height: 60,
                  child: item.itemInfo != null &&
                          (item.itemInfo!.imageUrl.isNotEmpty)
                      ? CachedNetworkImage(
                          imageUrl: item.itemInfo!.imageUrl,
                          errorWidget: (context, url, _) => SvgPicture.asset(
                              kProductPlaceholderImage,
                              width: 80))
                      : SvgPicture.asset(kProductPlaceholderImage, width: 60),
                ),
                AppText(
                  align: TextAlign.center,
                  text:
                      "${item.terms!.pvEach} ${"pv".tr} | ${item.terms!.priceEach!.precisionCheck} ${Globals.currency}",
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
