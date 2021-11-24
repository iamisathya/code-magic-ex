import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/cart_products.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              width: 80,
              height: 65,
              child: const FlutterLogo(size: 61),
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
                                text: "CODE: ${item.itemCode}",
                                style: TextTypes.caption,
                                color: AppColor.metallicSilver),
                            AppText(
                                text:
                                    "${item.totalPv} PV | ${item.totalPrice} THB",
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
