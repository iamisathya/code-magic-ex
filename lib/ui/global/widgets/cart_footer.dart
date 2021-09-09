import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/extensions.dart';
import 'primary_button.dart';

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
                    _renderText("${"totalprice".tr} : ", context),
                    _renderText(totalCartPrice.toString(), context),
                  ],
                ),
                Row(
                  children: [
                    _renderText("${"totalpv".tr} : ", context),
                    _renderText(totalCartPv.toString(), context),
                  ],
                ),
              ],
            ),
            PrimaryButton(text: "place_order".tr, press: () => onPressed())
          ],
        ));
  }

  Text _renderText(String value, BuildContext context) {
    return Text(value, style: Theme.of(context).textTheme.cartFooter);
  }
}
