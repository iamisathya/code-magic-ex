import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/images.dart';
import '../controller/dashboard.controller.dart';

class DashboardHeader extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: controller.openSettingsPage,
            child: SvgPicture.asset(kSettingsIcon,
                color: AppColor.kBlackColor,
                height: 20,
                semanticsLabel: "settings"),
          ),
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
