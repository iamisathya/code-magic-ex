import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/easy_ship/controller/easyship.list.controller.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      color: const Color(0xFFFFBF3A),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
              text: "BA Number: ${controller.userId}",
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
