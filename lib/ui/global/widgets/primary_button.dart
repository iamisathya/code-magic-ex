import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.press,
    this.loading = false,
    this.showIcon = false,
    this.color = kMainColor,
  }) : super();
  final String text;
  final Function press;
  final bool loading;
  final bool showIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator(color: Colors.blueAccent)
        : SizedBox(
            width: getProportionateScreenWidth(150),
            height: getProportionateScreenHeight(56),
            child: ElevatedButton.icon(
              icon: Text(text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(14),
                  )),
              label: showIcon
                  ? const Icon(Icons.arrow_forward,
                      size: 16, color: Colors.white)
                  : const SizedBox(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
              onPressed: () => press(),
            ));
  }
}
