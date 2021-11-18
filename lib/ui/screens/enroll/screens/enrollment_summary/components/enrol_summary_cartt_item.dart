import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EnrollSummaryCartItem extends StatelessWidget {
  final CartProductsItem item;
  final int idx;

  const EnrollSummaryCartItem({required this.item, required this.idx, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFFFF),
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
                    child: SvgPicture.asset(kProductPlaceholderImage,
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
                          text: "Code: ${item.itemCode}",
                          style: TextTypes.caption,
                          color: const Color(0xFF9EA9B9),
                        ),
                        AppText(
                          text: "${item.itemPv} PV | ${item.itemPrice} THB",
                          style: TextTypes.subtitle1,
                          color: const Color(0xFF384250),
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
                    width: 5, child: VerticalDivider(color: Color(0xFFD0D0CF))),
                Expanded(
                  child: AppText(
                      text: "${item.totalPv} PV",
                      style: TextTypes.subtitle1,
                      align: TextAlign.center),
                ),
                const SizedBox(
                    width: 5, child: VerticalDivider(color: Color(0xFFD0D0CF))),
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
