import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/globals.dart';
import '../../../../../models/inventory_item_v2.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../controller/inventory.home.controller.dart';

class InventoryItemClass extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());
  final InventoryItem item;
  InventoryItemClass({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 340,
      decoration: BoxDecoration(
          color: controller.activeStockType == "onHand"
              ? AppColor.bubbles
              : AppColor.isabelline,
          borderRadius: const BorderRadius.all(Radius.circular(3.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: AppText(
                maxLines: 1,
                align: TextAlign.center,
                text: item.catalogSlide!.content!.description!,
                style: TextTypes.headline6),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColor.kWhiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 165,
                    padding: const EdgeInsets.all(20.0),
                    child: CachedNetworkImage(
                        imageUrl: item.itemInfo != null
                            ? item.itemInfo!.imageUrl
                            : "",
                        width: 165,
                        errorWidget: (context, url, error) => SvgPicture.asset(
                            kProductPlaceholderImage,
                            height: 165,
                            semanticsLabel: 'Inventory image not found!'))),
                Container(
                  height: 105,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.sunglow),
                      borderRadius: BorderRadius.circular(2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppText(
                            text: "quantiity_on_hand".tr,
                            align: TextAlign.center,
                            style: TextTypes.bodyText2,
                            color: AppColor.metallicSilver),
                      ),
                      AppText(
                          text: item.quantityOnHand!,
                          style: TextTypes.headline4,
                          color: AppColor.vividMalachite),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                          text:
                              "${item.terms!.pvEach} ${"pv".tr} | ${NumberFormat().format(item.terms!.priceEach!.toInt())} ${Globals.currency}",
                          style: TextTypes.subtitle2),
                      AppText(
                          text: "${"item_code".tr}: ${item.item!.id!.unicity}",
                          style: TextTypes.subtitle2),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                    height: 1,
                    color: AppColor.brightGray,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        text: "${"total_price".tr}:",
                        style: TextTypes.bodyText2,
                        color: AppColor.darkLiver),
                    AppText(
                        text: "${item.totalPrice}  ${Globals.currency}",
                        style: TextTypes.bodyText2,
                        color: AppColor.darkLiver),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        text: "${"total_pv".tr}:",
                        style: TextTypes.bodyText2,
                        color: AppColor.darkLiver),
                    AppText(
                        text: "${item.totalPv} ${"pv".tr}",
                        style: TextTypes.bodyText2,
                        color: AppColor.darkLiver),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
