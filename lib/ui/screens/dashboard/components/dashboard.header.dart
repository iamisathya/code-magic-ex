import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(kSettingsIcon,
              height: 20, semanticsLabel: "settings"),
          Image.asset(
            kUnicityGradientImage,
            fit: BoxFit.cover,
            width: 190,
            semanticLabel: "unicity logo",
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
