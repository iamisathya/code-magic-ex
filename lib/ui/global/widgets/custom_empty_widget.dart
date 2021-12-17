import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilities/size_config.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    required this.svgIcon,
    this.message = "sorry_no_data_found", //! hardcoded
  }) : super();

  final String svgIcon;
  final String message;

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(message),
          ),
        ]));
  }
}
