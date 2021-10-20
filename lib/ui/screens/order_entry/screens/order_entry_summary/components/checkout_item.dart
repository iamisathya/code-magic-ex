import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: 61,
              height: 50,
              child: const FlutterLogo(size: 61),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: AppText(
                        text: "Coffee Mix (Bio Reishi Brand)",
                        style: TextTypes.subtitle2),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            AppText(
                                text: "CODE: 19852",
                                style: TextTypes.caption,
                                color: Color(0xff9ea9b9)),
                            AppText(
                                text: "3 PV | 310 THB",
                                style: TextTypes.bodyText2,
                                color: Color(0xFF384250)),
                          ],
                        ),
                        const QuantityCounter()
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: const Color(0xffd0d0cf),
          width: 0.50,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppText(text: "-", style: TextTypes.headline4),
          Container(
            width: 34,
            alignment: Alignment.center,
            child: const AppText(text: "1", style: TextTypes.bodyText1),
          ),
          const AppText(text: "+", style: TextTypes.headline4),
        ],
      ),
    );
  }
}
