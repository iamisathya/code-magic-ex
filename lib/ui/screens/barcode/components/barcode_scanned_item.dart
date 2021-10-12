import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/barcode_item_response.dart';
import '../../../../utilities/images.dart';

class BarcodeScannedItem extends StatelessWidget {
  final BarcodeItem item;

  const BarcodeScannedItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 65,
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(color: const Color(0xFFD0D0CF), width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(3.0))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(kSuccessIcon,
                  height: 25, width: 25, semanticsLabel: 'success icon'),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.desc, style: Theme.of(context).textTheme.bodyText1),
                  Text("Scanned:${item.scan}/${item.qty}",
                      style: Theme.of(context).textTheme.bodyText2)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(kPlusIcon,
                  height: 15, width: 15, semanticsLabel: 'add icon'),
            ),
          ],
        ),
      ),
      children: const <Widget> [
        Text("Number: 1"),
        Text("Number: 2"),
        Text("Number: 3"),
        Text("Number: 4"),
        Text("Number: 5")
      ],
    );
  }
}
