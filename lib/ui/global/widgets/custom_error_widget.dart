import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utilities/size_config.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.svgIcon,
    this.showMessage = true,
  }) : super();

  final String svgIcon;
  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight,
        alignment: FractionalOffset.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            svgIcon,
            width: SizeConfig.screenWidth * 0.8,
          ),
          const SizedBox(
            height: 20,
          ),
          if (showMessage == true)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("sorry_something_went_wrong".tr),
            )
          else
            const SizedBox(),
        ]));
  }
}
