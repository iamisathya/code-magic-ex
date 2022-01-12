// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
            width: getProportionateScreenWidth(100),
            height: getProportionateScreenHeight(54),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () => press(),
              child: Text(text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: getProportionateScreenWidth(14),
                  )),
            ));
  }
}
