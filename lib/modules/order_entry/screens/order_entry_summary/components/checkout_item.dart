import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../data/provider/globals.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/styles/border.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../data/model/cart_products.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/images.dart';
import 'quantity_counter.dart';

class CheckoutItem extends StatelessWidget {
  final CartProductsItem item;

  const CheckoutItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: borderRadiusWithColor(bgColor: AppColor.kWhiteColor),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              width: 80,
              height: 65,
              child: item.imageUrl.isNotEmpty
                  ? CachedNetworkImage(imageUrl: item.imageUrl)
                  : SvgPicture.asset(kProductPlaceholderImage, width: 61),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppText(
                        text: item.productName, style: TextTypes.subtitle2),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                text: "${"code".tr}: ${item.itemCode}",
                                style: TextTypes.caption,
                                color: AppColor.metallicSilver),
                            AppText(
                                text:
                                    "${item.totalPv} ${"pv".tr} | ${item.totalPrice.precisionCheck} ${Globals.currency}",
                                style: TextTypes.bodyText2,
                                color: AppColor.charcoal),
                          ],
                        ),
                        QuantityCounter(item: item)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
