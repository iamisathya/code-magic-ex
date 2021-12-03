import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/globals.dart';
import '../../../../models/inventory_records.dart';
import '../../../../utilities/images.dart';
import '../../../../utilities/parsing.dart';
import '../controller/inventory.home.controller.dart';

class InventoryItem extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());
  final InventoryRecordItems item;
  InventoryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final double totalPrice =
        Parsing.intFrom(item.quantityOnHand)! * item.terms.priceEach;
    final String totalPriceString = NumberFormat().format(totalPrice.toInt());
    final int totalPv =
        Parsing.intFrom(item.quantityOnHand)! * item.terms.pvEach;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 340,
      decoration: BoxDecoration(
          color: controller.activeStockType.value.value == "onHand"
              ? AppColor.cultured
              : AppColor.isabelline,
          borderRadius: const BorderRadius.all(Radius.circular(3.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(item.catalogSlideContent.content.description,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: AppColor.kBlackColor)),
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
                  child: SvgPicture.asset(kProductPlaceholderImage,
                      height: 165, semanticsLabel: 'no records found'),
                ),
                Container(
                  height: 105,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.kWhiteColor),
                      borderRadius: BorderRadius.circular(2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "quantiity_on_hand".tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColor.metallicSilver),
                        ),
                      ),
                      Text(
                        item.quantityOnHand,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: AppColor.mediumAquamarine),
                      ),
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
                      Text(
                          "${item.terms.pvEach} ${"pv".tr} | ${NumberFormat().format(item.terms.priceEach.toInt())} ${Globals.currency}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: AppColor.kBlackColor)),
                      Text("${"item_code".tr}: ${item.item.id.unicity}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: AppColor.kBlackColor)),
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
                    Text("${"total_price".tr}:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColor.cadet)),
                    Text("$totalPriceString  ${Globals.currency}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColor.cadet)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${"total_pv".tr}:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColor.cadet)),
                    Text("$totalPv ${"pv".tr}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColor.cadet)),
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
