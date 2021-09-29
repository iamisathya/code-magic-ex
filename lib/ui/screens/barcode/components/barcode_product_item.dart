
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarcodeProductItem extends StatelessWidget {
  const BarcodeProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(
              color: const Color(0xFFD0D0CF), width: 0.5),
          borderRadius:
              const BorderRadius.all(Radius.circular(3.0))),
      margin:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(kWarningIcon,
                        height: 25,
                        width: 25,
                        semanticsLabel: 'warning icon'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0),
                      child: Text("Scan: 0",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2),
                    )
                  ],
                ),
                Text("Qty: 1",
                    style: Theme.of(context).textTheme.subtitle2)
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text("Promo Free Sanitizer Spray TH",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Code: 19236",
                    style: Theme.of(context).textTheme.bodyText2),
                Text("Remains: 1",
                    style: Theme.of(context).textTheme.subtitle2)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
