import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/extensions.dart';

class CartFooter extends StatelessWidget {
  final Function onPressed;
  final int totalCartPv;
  final double totalCartPrice;

  const CartFooter({
    required this.onPressed,
    required this.totalCartPv,
    required this.totalCartPrice,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: kEdgeV12H16(),
        color: kPageBackground,
        width: Get.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _renderText("Total Price: ", context),
                    _renderText(totalCartPrice.toString(), context),
                  ],
                ),
                Row(
                  children: [
                    _renderText("Total PV: ", context),
                    _renderText(totalCartPv.toString(), context),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kMainColor, padding: kEdgeA12()),
              onPressed: () => onPressed(),
              child: const Text("Place Order"),
            ),
          ],
        ));
  }

  Text _renderText(String value, BuildContext context) {
    return Text(value, style: Theme.of(context).textTheme.cartFooter);
  }
}
