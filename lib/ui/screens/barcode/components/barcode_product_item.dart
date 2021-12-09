import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../models/barcode_item_response.dart';
import '../../../../utilities/images.dart';

class BarcodeProductItem extends StatelessWidget {
  final BarcodeItem item;

  const BarcodeProductItem({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.kWhiteColor,
          border: Border.all(color: AppColor.americanSilver, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(3.0))),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(kWarningIcon,
                        height: 25, width: 25, semanticsLabel: 'warning icon'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("${"scan".tr}: ${item.scan}",
                          style: Theme.of(context).textTheme.subtitle2),
                    )
                  ],
                ),
                Text("${"qty".tr}: ${item.qty}",
                    style: Theme.of(context).textTheme.subtitle2)
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text(item.desc,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${"code".tr}: ${item.code}",
                    style: Theme.of(context).textTheme.bodyText2),
                Text("${"remains".tr}: ${item.remain}",
                    style: Theme.of(context).textTheme.subtitle2)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
