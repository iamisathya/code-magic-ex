import 'package:dsc_tools/data/enums.dart';
import 'package:dsc_tools/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/border.dart';
import '../../../core/values/colors.dart';
import '../../../data/model/sales_report_item_item.dart';
import '../controller/salesreports.home.controller.dart';

class SalesReportEachItemItem extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
  final SalesReportItemItem item;

  SalesReportEachItemItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _renderEachRow(
                context, item.description, "${"code".tr}: ${item.itemCode}",
                type: TextTypes.headline6),
            _renderEachRow(
                context, "${"pv".tr}: ${item.pv}", "${"unit".tr}: ${item.qty}"),
            GrandTotal(totalPv: item.totalPv.toString()),
          ],
        ),
      ),
    );
  }

  Widget _renderEachRow(BuildContext context, String value1, String value2,
      {TextTypes type = TextTypes.bodyText2}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: value1, style: type, color: AppColor.darkLiver),
          AppText(
              text: value2,
              style: TextTypes.bodyText2,
              color: AppColor.darkLiver)
        ],
      ),
    );
  }
}

class GrandTotal extends StatelessWidget {
  final String totalPv;

  const GrandTotal({required this.totalPv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: borderRadiusWithColor(bgColor: AppColor.bubbles),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "${"total_pv".tr}:", style: TextTypes.bodyText2),
              AppText(text: "$totalPv ${"pv".tr}", style: TextTypes.bodyText2),
            ],
          ),
        ),
      ]),
    );
  }
}
