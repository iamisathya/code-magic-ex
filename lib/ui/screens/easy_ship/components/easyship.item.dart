import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/globals.dart';
import '../../../../models/easy_ship_reports.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/images.dart';
import '../../../global/theme/text_view.dart';

class EasyShipItem extends StatelessWidget {
  final int index;
  final String date;
  final List<EasyShipReports> item;

  const EasyShipItem(
      {required this.index, required this.item, required this.date});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 122),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.65),
        ),
        child: Stack(children: [
          Positioned(left: 70,  top: 54, child: Image.asset(kCheckSuccessIconPng, width: 20)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              width: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: Column(
                  children: [
                  AppText(text: index.toString(), style: TextTypes.headline6),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: AppText(
                      text: date.asMMM,
                      style: TextTypes.headline4,
                      color: AppColor.sunglow,
                    ),
                  ),
                  AppText(
                    text: date.asYYYY,
                    style: TextTypes.caption,
                    color: AppColor.darkLiver,
                  ),
                ]),
              ),
            ),
            Expanded(
              child: Container(
                decoration: DottedDecoration(linePosition: LinePosition.left),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: item
                      .mapIndexed((elem, idx) => _renderDescrption(elem, idx))
                      .toList(),
                ),
              ),
            )
          ]),
        ]),
      ),
    );
  }

  Column _renderDescrption(EasyShipReports element, int idx) {
    final bool isLast = idx != item.length - 1;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: element.name, style: TextTypes.headline6),
          AppText(
              text: "Code: ${element.itemName}", style: TextTypes.bodyText2),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: AppText(
            text: "Order Number ${element.pvDate.asMMM}",
            style: TextTypes.bodyText2,
            color: AppColor.darkLiver,
          ),
        ),
      ),
      Container(
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: AppColor.brightGraySecond,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: "Total PV: ${element.pv.toString()} PV",
              style: TextTypes.caption,
              color: AppColor.darkLiver,
            ),
            AppText(
              text: "Total Price: ${element.totalPrice} ${Globals.currency}",
              style: TextTypes.caption,
              color: AppColor.darkLiver,
            ),
          ],
        ),
      ),
      if (isLast)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: isLast ? DottedDecoration() : null,
          ),
        )
    ]);
  }
}
