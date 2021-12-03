import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/images.dart';
import '../../../global/theme/text_view.dart';
import '../controller/easyship.list.controller.dart';

class PageToolBox extends StatelessWidget {
  const PageToolBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EasyShipListController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      color: AppColor.sunglow,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
              text: "${"ba_number".tr}: ${controller.userId}",
              style: TextTypes.subtitle1),
          GestureDetector(
            onTap: () => controller.onCaptureScreenShot(context),
            child: SvgPicture.asset(
              kScreenShotIcon,
              width: 20,
            ),
          )
        ],
      ),
    );
  }
}
