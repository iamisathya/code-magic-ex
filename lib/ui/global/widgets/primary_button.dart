import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
            width: getProportionateScreenWidth(200),
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
                  backgroundColor: MaterialStateProperty.all(kMainColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
              onPressed: () => press(),
            ));
  }
}
