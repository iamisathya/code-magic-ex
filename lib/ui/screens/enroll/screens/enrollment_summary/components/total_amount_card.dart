import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/ui/screens/enroll/controllers/enroll.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'each_info_row.dart';

class TotalAmountCard extends StatelessWidget {
  final EnrollHomeController ctrl = Get.put(EnrollHomeController());
  TotalAmountCard({
    Key? key,
    required this.boldFont,
  }) : super(key: key);

  final TextStyle boldFont;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 20),
        child: Column(
          children: [
            EeachUserinfoItem(title: "Product Price", value: "${ctrl.totalCartPrice} ${Globals.currency}"),
            EeachUserinfoItem(title: "Delivery Fee", value: "0 ${Globals.currency}"),
            const EeachUserinfoItem(
                title: "Shipping Method", value: "Delivery"),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 12.5),
                child: Container(decoration: DottedDecoration())),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("Total PV", style: boldFont)),
                  Flexible(
                    flex: 2,
                    child: Text("${ctrl.totalCartPv} PV", style: boldFont),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("Total Price", style: boldFont)),
                  Flexible(
                    flex: 2,
                    child: Text("${ctrl.totalCartPrice} ${Globals.currency}", style: boldFont),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
