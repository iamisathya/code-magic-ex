import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class PrimaryOutlineButton extends StatelessWidget {
  const PrimaryOutlineButton({
    required this.text,
    required this.press,
    this.loading = false,
    this.showIcon = false,
  }) : super();
  final String text;
  final Function press;
  final bool loading;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator(color: Colors.blueAccent)
        : SizedBox(
            width: getProportionateScreenWidth(150),
            height: getProportionateScreenHeight(56),
            child: FlatButton.icon(
              icon: Text(text,
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: getProportionateScreenWidth(14),
                  )),
              label: showIcon
                  ? const Icon(Icons.arrow_forward,
                      size: 16, color: kMainColor)
                  : const SizedBox(),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: kMainColor, width: 3),
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () => press(),
            ));
  }
}
