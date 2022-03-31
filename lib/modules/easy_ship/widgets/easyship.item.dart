import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../../data/provider/globals.dart';
import '../../../../widgets/text_view.dart';
import '../../../core/values/colors.dart';
import '../../../data/model/easy_ship_report_with_total.dart';
import '../../../data/model/easy_ship_reports.dart';
import '../../../utils/extensions.dart';
import '../../../utils/images.dart';

class EasyShipItem extends StatelessWidget {
  final int index;
  // final String date;
  // final List<EasyShipReports> item;
  final EasyShipReportsWithTotal item;

  const EasyShipItem({required this.index, required this.item});

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
          Positioned(
              left: 70,
              top: 54,
              child: Image.asset(kCheckSuccessIconPng, width: 20)),
          if (item.totalPrice == 0)
            Positioned(
                left: 10,
                bottom: 10,
                child:
                    SvgPicture.asset(kFreeGiftEasyshipPromoColored, width: 40)),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: Column(children: [
                  AppText(text: index.toString(), style: TextTypes.headline6),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: AppText(
                      text: item.month!.asMMM,
                      style: TextTypes.headline4,
                      color: AppColor.sunglow,
                    ),
                  ),
                  AppText(
                    text: item.month!.asYYYY,
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
                  children: [
                    Column(
                      children: item.reports!
                          .mapIndexed((elem, idx) => _renderDescrption(
                              elem, idx, idx != item.reports!.length - 1))
                          .toList(),
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
                            text:
                                "${"total_pv".tr}: ${item.totalPv} ${"pv".tr}",
                            style: TextTypes.caption,
                            color: AppColor.darkLiver,
                          ),
                          AppText(
                            text:
                                "${"total_price".tr}: ${item.totalPrice?.doubleNumberFormat()} ${Globals.currency}",
                            style: TextTypes.caption,
                            color: AppColor.darkLiver,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Column _renderDescrption(EasyShipReports element, int idx, bool isLast) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: AppText(text: element.name, style: TextTypes.headline6)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppText(
                text: "${"code".tr}: ${element.itemName}",
                style: TextTypes.bodyText2),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: AppText(
            text: "${"order_number".tr} ${element.orderNumber}",
            style: TextTypes.bodyText2,
            color: AppColor.darkLiver,
          ),
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
