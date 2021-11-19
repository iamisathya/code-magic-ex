import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../models/open_po.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/theme/text_view.dart';
import '../../controller/openpo.list.controller.dart';
import 'open_po_details.dart';

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
        onTap: () =>
            Get.to(() => OpenPODetailsPage(), arguments: openPo.orderOpid),
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
                          if (attchmentName.isNotEmpty)
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => controller.openDialog(
                                      context, attchmentName),
                                  child: SvgPicture.asset(kOpenPoCameraIcon,
                                      height: 20,
                                      semanticsLabel: "Open PO attachment"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFA758E),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: AppText(
                                        text: attchmentName.isNotEmpty
                                            ? "1"
                                            : "0",
                                        style: TextTypes.bodyText2,
                                        color: Colors.white)),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          GestureDetector(
                            onTap: () => Get.to(() => OpenPODetailsPage(),
                                arguments: openPo.orderOpid),
                            child: SvgPicture.asset(kOpenPoViewIcon,
                                height: 20, semanticsLabel: "View Open PO"),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // GestureDetector(
                          //   onTap: () => Get.to(() => OpenPODetailsPage(), arguments: openPo.orderOpid),
                          //   child: SvgPicture.asset(kOpenPoEditIcon,
                          //       height: 20, semanticsLabel: "Edit Open PO"),
                          // ),
                        ],
                      ),
                      controller.getStatusIcon(openPo.orderStatus)
                    ],
                  ),
                ),
              ],
            )),
      ),
      Positioned(
        top: 10,
        right: 20,
        child: GestureDetector(
          onTap: () => controller.showInofPopover(context),
          child: SvgPicture.asset(kInformationIcon,
              height: 20, semanticsLabel: "Add PO"),
        ),
      ),
    ]);
  }
}
