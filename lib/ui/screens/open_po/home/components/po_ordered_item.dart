import '../../../../global/theme/text_view.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/globals.dart';
import '../../../../../models/open_po_details.dart';

class PoOrderedItem extends StatelessWidget {
  final OpenPlaceOrderDetails item;
  final int idx;

  const PoOrderedItem({required this.item, required this.idx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFFFFFFFF),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(
                    text: item.productName,
                    align: TextAlign.center,
                    style: TextTypes.subtitle2,
                    color: const Color(0xFF384250)),
                AppText(
                    text: "code: ${item.productId}",
                    style: TextTypes.caption,
                    color: const Color(0xFF9EA9B9)),
                AppText(
                    text:
                        "${item.productPv} PV | ${item.productPrice} ${Globals.currency}",
                    style: TextTypes.subtitle2,
                    color: const Color(0xFF384250)),
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFD0D0CF)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const AppText(
                            text: "-",
                            style: TextTypes.headline4,
                            color: Color(0xFF384250)),
                        AppText(
                            text: item.productQty,
                            style: TextTypes.subtitle1,
                            color: const Color(0xFF384250)),
                        const AppText(
                            text: "+",
                            style: TextTypes.headline4,
                            color: Color(0xFF384250)),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
