import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../models/order_list_rmas.dart';
import '../../../../utilities/extensions.dart';
import '../../../../utilities/images.dart';
import '../controller/salesreports.home.controller.dart';
import 'grand_total.dart';
import 'print_report.dart';

class SalesReportItem extends StatelessWidget {
  final SalesReportHomeController controller =
      Get.put(SalesReportHomeController());
  final OrderItem item;

  SalesReportItem({required this.item});

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
                child: Text(item.customer.humanName.fullName,
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
                  item.paymentStatus == "Unknown"
                      ? kBarcodeErrorIcon
                      : kBarcodeSuccessIcon,
                  height: 25,
                  width: 50,
                  semanticsLabel: "barcode",
                ),
              ),
            ],
          ),
          _renderEachRow(context, "BA Number: ${item.customer.id.unicity}",
              "Barcode: xxxxxx"),
          _renderOrderIdRow(
              context,
              "Order ID: ",
              item.id.unicity.retrieveOrderId(),
              "Date: ${item.dateCreated.asDDMMYYYY}",
              item.href),
          _renderEachRow(context, "Record: ${item.creator.humanName.fullName}",
              "Time: ${item.dateCreated.asHHMMA}"),
          GrandTotal(
              status: item.paymentStatus,
              totalPrice: "${item.terms.total}",
              totalPv: "${item.terms.total}"),
        ],
      ),
    );
  }

  Widget _renderOrderIdRow(BuildContext context, String title1, String value1,
      String value2, String href) {
    final Map<String, dynamic> args = {"orderId": value1, "href": href};
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
