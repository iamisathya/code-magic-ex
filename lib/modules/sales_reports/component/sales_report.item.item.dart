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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(item.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColor.kBlackColor)),
                ),
                const SizedBox()
              ],
            ),
            _renderEachRow(context, "${"ba_number".tr}: ${item.itemCode}", ""),
            _renderEachRow(context, "${"pv".tr}: ${item.pv}",
                "${"quatity".tr}: ${item.qty}"),
            GrandTotal(totalPv: item.totalPv.toString()),
          ],
        ),
      ),
    );
  }

  Widget _renderEachRow(BuildContext context, String value1, String value2) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value1,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColor.darkLiver)),
          Text(value2,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColor.darkLiver)),
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
          decoration: borderRadiusWithColor(bgColor: AppColor.cultured),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${"total_pv".tr}:",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColor.kBlackColor),
              ),
              Text(
                totalPv,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColor.kBlackColor),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
