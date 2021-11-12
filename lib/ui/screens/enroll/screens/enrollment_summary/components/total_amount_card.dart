import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:flutter/material.dart';

import 'each_info_row.dart';

class TotalAmountCard extends StatelessWidget {
  const TotalAmountCard({
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
            const EeachUserinfoItem(title: "Product Price", value: "0 THB"),
            const EeachUserinfoItem(title: "Product Price", value: "0 THB"),
            const EeachUserinfoItem(
                title: "Shipping Method", value: "Delivery"),
            const EeachUserinfoItem(
                title: "Email", value: "patthiraya@gmail.com"),
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
                    child: Text("220 PV", style: boldFont),
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
                    child: Text("34,340 ${Globals.currency}", style: boldFont),
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
