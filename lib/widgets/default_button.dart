import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.text,
    required this.press,
    this.loading = false,
  }) : super();
  final String text;
  final Function press;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator(color: Colors.blueAccent)
        : SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(56),
            child: ElevatedButton.icon(
              icon: Text(text,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: getProportionateScreenWidth(14),
                  )),
              label: const Icon(Icons.arrow_forward,
                  size: 16, color: Colors.blueAccent),
              style: ButtonStyle(shape: elevatedShape()),
              onPressed: () => press(),
            ));
  }
}
