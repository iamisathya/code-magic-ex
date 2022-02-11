import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.press,
    this.loading = false,
    this.color = kMainColor,
  }) : super();
  final String text;
  final Function press;
  final bool loading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary)
        : SizedBox(
            width: getProportionateScreenWidth(120),
            height: getProportionateScreenHeight(54),
            child: ElevatedButton(onPressed: () => press(), child: Text(text)));
  }
}
