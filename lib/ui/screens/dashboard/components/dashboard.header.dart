import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/images.dart';

class DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(kSettingsIcon,
              color: AppColor.kBlackColor,
              height: 20,
              semanticsLabel: "settings"),
          Image.asset(
            kUnicityGradientImage,
            width: 190,
            semanticLabel: "unicity logo",
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
