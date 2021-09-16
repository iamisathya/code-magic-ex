import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../models/sales_report_rma_item.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/images.dart';
import '../controller/salesreports.home.controller.dart';
import 'grand_total.dart';
import 'print_report.dart';

class SalesReportEachRmaItem extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
  final SalesReportRmaItem item;

  SalesReportEachRmaItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: const Color(0xFF000000))),
              ),
              SizedBox(
                width: 70,
                child: SvgPicture.asset(
                  item.rmaOrderNumber.contains("glyphicon-ok-circle")
                      ? kBarcodeSuccessIcon
                      : kBarcodeErrorIcon,
                  height: 25,
                  width: 50,
                  semanticsLabel: "barcode",
                ),
              ),
            ],
          ),
          _renderBarcodeRow(
              context,
              "BA Number: ${item.customer}",
              "RMA: ",
              item.rmaOrderNumber.retrieveBarcode(),
              item.rmaOrderNumber.retrieveHrefCode()),
          _renderOrderIdRow(
              context,
              "Order ID: ",
              item.orderNumber.retrieveBarcode(),
              "Date: ${item.date}",
              item.orderNumber.retrieveHrefCode()),
          _renderEachRow(
              context, "Record: ${item.inputData}", "Time: ${item.time}"),
          GrandTotal(
              status: item.rmaOrderNumber.contains("glyphicon-ok-circle")
                  ? "Unknown"
                  : "Success",
              totalPrice: item.total,
              totalPv: item.totalPv.toString()),
        ],
      ),
    );
  }

  Widget _renderOrderIdRow(BuildContext context, String title1, String value1,
      String value2, String href) {
    final Map<String, dynamic> args = {"orderId": value1, "href": href, "readyUrl": true};
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text(title1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xFF505050))),
            GestureDetector(
                // onTap: () => controller.proceedToPrint(context, orderHref: href),
                onTap: () => Get.to(() => PrintSalesReport(), arguments: args),
                child: Text(value1,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color(0xFF1C9CFC),
                        fontWeight: FontWeight.w600))),
          ]),
          Text(value2,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: const Color(0xFF505050))),
        ],
      ),
    );
  }

  Widget _renderBarcodeRow(BuildContext context, String title1, String title2,
      String value2, String href) {
    final Map<String, dynamic> args = {"orderId": value2, "href": href, "readyUrl": true};
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title1,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: const Color(0xFF505050))),
          Row(children: [
            Text(title2,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xFF505050))),
            GestureDetector(
                // onTap: () => controller.proceedToPrint(context, orderHref: href),
                onTap: () => Get.to(() => PrintSalesReport(), arguments: args),
                child: Text(value2,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color(0xFF1C9CFC),
                        fontWeight: FontWeight.w600))),
          ]),
        ],
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
                  .copyWith(color: const Color(0xFF505050))),
          Text(value2,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: const Color(0xFF505050))),
        ],
      ),
    );
  }
}
