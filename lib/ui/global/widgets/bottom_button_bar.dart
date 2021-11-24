import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../screens/order_entry/orderentry.screen.dart';

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({
    Key? key,
    this.isShown = true,
    required this.showNeutral,
    required this.onTapCancelButton,
    this.onTapNeutralButton,
    this.onTapPositiveButton,
    this.positiveText = "next",
    this.bgColor = AppColor.kWhiteColor,
    this.negetiveText = "cancel",
    this.neutralText = "back",
  }) : super(key: key);

  final bool isShown;
  final bool showNeutral;
  final VoidCallback onTapCancelButton;
  final VoidCallback? onTapNeutralButton;
  final VoidCallback? onTapPositiveButton;
  final String positiveText;
  final String negetiveText;
  final String neutralText;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return isShown
        ? Container(
            height: 90,
            color: bgColor,
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: NegetiveButton(
                      title: negetiveText.tr, onTap: onTapCancelButton),
                ),
                Flexible(
                  child: showNeutral
                      ? NuetralButton(
                          title: neutralText.tr,
                          onTap: () => onTapNeutralButton!())
                      : PositiveButton(
                          title: positiveText.tr,
                          onTap: () => onTapPositiveButton!()),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
