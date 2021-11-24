import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/globals.dart';
import '../../../../../models/open_po_details.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                child: SvgPicture.asset(
              kProductPlaceholderImage,
              width: 100,
              height: 100,
            )),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText(
                      text: item.productName,
                      style: TextTypes.subtitle2,
                      color: AppColor.charcoal),
                  AppText(
                      text: "code: ${item.productId}",
                      style: TextTypes.caption,
                      color: AppColor.metallicSilver),
                  AppText(
                      text:
                          "${item.productPv} PV | ${item.productPrice} ${Globals.currency}",
                      style: TextTypes.subtitle2,
                      color: AppColor.charcoal),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.5, color: AppColor.americanSilver),
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
                        ]),
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
