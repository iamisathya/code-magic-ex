import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../data/enums.dart';
import '../../../../../../widgets/text_view.dart';
import '../../../../../core/values/colors.dart';
import '../../../../../utils/images.dart';

class TitleBar extends StatelessWidget {
  const TitleBar(
      {this.icon = kCameraIcon,
      this.title = "",
      this.color = AppColor.crayola});

  final String icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
