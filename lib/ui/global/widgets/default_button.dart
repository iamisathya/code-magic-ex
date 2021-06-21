import 'package:flutter/material.dart';

import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/size_config.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.text,
    required this.press,
  }) : super();
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        style: ButtonStyle(shape: elevatedShape()),
        onPressed: () => press,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: getProportionateScreenWidth(14),
          ),
        ),
      ),
    );
  }
}
