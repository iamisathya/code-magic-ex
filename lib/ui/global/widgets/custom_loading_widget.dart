import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilities/size_config.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    required this.svgIcon,
  }) : super();

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight,
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SvgPicture.asset(
            svgIcon,
            width: SizeConfig.screenWidth * 0.8,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              minHeight: 5,
            ),
          ),
        ]));
  }
}
