import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    required this.press,
  }) : super();
  final Function press;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      child: TextButton.icon(
        icon: const Icon(Icons.arrow_back_outlined,
            size: 18, color: Colors.black),
        label: Text("Back",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(16),
            )),
        onPressed: () => press(),
      ),
    );
  }
}
