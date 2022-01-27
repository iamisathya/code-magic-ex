import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({this.icon = kCameraIcon, this.title = ""});

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.crayola,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: AppText(text: title, style: TextTypes.subtitle1)),
            Flexible(child: SvgPicture.asset(icon)),
          ],
        ),
      ),
    );
  }
}
