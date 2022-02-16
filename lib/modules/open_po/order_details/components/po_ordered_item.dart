import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../data/enums.dart';
import '../../../../../data/provider/globals.dart';
import '../../../../../widgets/text_view.dart';
import '../../../../core/values/colors.dart';
import '../../../../data/model/open_po_details.dart';
import '../../../../utils/images.dart';

class PoOrderedItem extends StatelessWidget {
  final OpenPlaceOrderDetails item;
  final int idx;

  const PoOrderedItem({required this.item, required this.idx});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          children: [
            Expanded(
                child: (item.imageUrl != null && item.imageUrl!.isNotEmpty)
                    ? CachedNetworkImage(
                        imageUrl: item.imageUrl!,
                        errorWidget: (context, url, _) => SvgPicture.asset(
                            kProductPlaceholderImage,
                            width: 80))
                    : SvgPicture.asset(kProductPlaceholderImage,
                        height: 100, width: 100)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText(
                      text: item.productName,
                      style: TextTypes.subtitle2,
                      color: AppColor.charcoal),
                  AppText(
                      text: "${"code".tr}: ${item.productId}",
                      style: TextTypes.caption,
                      color: AppColor.metallicSilver),
                  AppText(
                      text:
                          "${item.productPv} ${"pv".tr} | ${item.productPrice} ${Globals.currency}",
                      style: TextTypes.subtitle2,
                      color: AppColor.charcoal),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: AppColor.americanSilver),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const AppText(
                            text: "-",
                            style: TextTypes.headline4,
                            color: AppColor.charcoal),
                        AppText(
                            text: item.productQty,
                            style: TextTypes.subtitle1,
                            color: AppColor.charcoal),
                        const AppText(
                            text: "+",
                            style: TextTypes.headline4,
                            color: AppColor.charcoal),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
