import 'package:dsc_tools/models/open_po.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/openpo.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/controller/openpo.list.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/open_po_details.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../utilities/extensions.dart';

class POItem extends StatelessWidget {
  final OpenPO openPo;
  final OpenPoListController controller;

  const POItem({required this.openPo, required this.controller});

  @override
  Widget build(BuildContext context) {
    final String attchmentName =
        openPo.iconAttachment.retrieveAttachementName();
    return Stack(children: [
      GestureDetector(
        onTap: () => Get.to(() => OpenPODetailsPage(), arguments: openPo.orderOpid),
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("PO Number: ${openPo.orderOpid}",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.subtitle1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total PV: ${openPo.orderTotalPv}",
                                  style: Theme.of(context).textTheme.caption),
                              Text("Date: ${openPo.orderDate}",
                                  style: Theme.of(context).textTheme.caption),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Price: ${openPo.orderTotalPrice}",
                                style: Theme.of(context).textTheme.caption),
                            Text("Date: ${openPo.orderTime}",
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(height: 1, color: Color(0xFFE3E8ED)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => attchmentName.isNotEmpty
                                ? controller.openDialog(context, attchmentName)
                                : null,
                            child: SvgPicture.asset(
                                attchmentName.isNotEmpty
                                    ? kPoAttachmentIcon
                                    : kAttachmentInactiveIcon,
                                height: 20,
                                semanticsLabel: "Add PO"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            attchmentName.isNotEmpty ? "1" : "0",
                            style: const TextStyle(color: Color(0xFF505050)),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                          controller.getStatusIcon(openPo.orderStatus),
                          height: 20,
                          semanticsLabel: "Add PO"),
                    ],
                  ),
                ),
              ],
            )),
      ),
      Positioned(
        top: 10,
        right: 20,
        child: SvgPicture.asset(kInformationIcon,
            height: 20, semanticsLabel: "Add PO"),
      ),
    ]);
  }
}
