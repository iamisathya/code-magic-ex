import 'package:dsc_tools/models/order_list_rmas.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utilities/extensions.dart';

import 'grand_total.dart';

class SalesReportItem extends StatelessWidget {
  final OrderItem item;

  const SalesReportItem({required this.item});

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
          _renderEachRow(
              context, "BA Number: ${item.id.unicity}", "Barcode: xxxxxx"),
          _renderEachRow(context, "Order ID: ${item.id.unicity}",
              "Date: ${item.dateCreated.asDDMMYYYY}"),
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
