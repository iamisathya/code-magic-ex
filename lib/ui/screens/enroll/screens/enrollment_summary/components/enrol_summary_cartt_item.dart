import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/globals.dart';
import '../../../../../../models/cart_products.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import '../../../../../global/theme/text_view.dart';

class EnrollSummaryCartItem extends StatelessWidget {
  final CartProductsItem item;
  final int idx;

  const EnrollSummaryCartItem({required this.item, required this.idx, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.kWhiteColor,
      child: Column(
        children: [
          SizedBox(
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    height: 100,
                    width: 134,
                    child: (item.imageUrl.isNotEmpty)
                        ? CachedNetworkImage(imageUrl: item.imageUrl)
                        : SvgPicture.asset(kProductPlaceholderImage,
                            height: 100, width: 134)),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppText(
                          text: item.productName,
                          style: TextTypes.subtitle1,
                        ),
                        AppText(
                          text: "${"code".tr}: ${item.itemCode}",
                          style: TextTypes.caption,
                          color: AppColor.metallicSilver,
                        ),
                        AppText(
                          text:
                              "${item.itemPv} ${"pv".tr} | ${item.itemPrice} ${Globals.currency}",
                          style: TextTypes.subtitle1,
                          color: AppColor.charcoal,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: AppText(
                        text: "x ${item.quantity}",
                        style: TextTypes.subtitle1,
                        align: TextAlign.center)),
                const SizedBox(
                    width: 5,
                    child: VerticalDivider(color: AppColor.americanSilver)),
                Expanded(
                  child: AppText(
                      text: "${item.totalPv} ${"pv".tr}",
                      style: TextTypes.subtitle1,
                      align: TextAlign.center),
                ),
                const SizedBox(
                    width: 5,
                    child: VerticalDivider(color: AppColor.americanSilver)),
                Expanded(
                  child: AppText(
                      text: "${item.totalPrice} ${Globals.currency}",
                      style: TextTypes.subtitle1,
                      align: TextAlign.center),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
