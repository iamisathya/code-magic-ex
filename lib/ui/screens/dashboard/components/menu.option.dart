import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utilities/images.dart';

class MenuOption extends StatelessWidget {
  final String optionTitle;
  final String icon;
  final Function? onPress;

  const MenuOption({this.icon = "", this.optionTitle = "", this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset(icon,
                  height: 20, width: 20, semanticsLabel: optionTitle),
            ),
            Expanded(
                child: Text(
              optionTitle,
              style: Theme.of(context).textTheme.headline6,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SvgPicture.asset(kArrowIcon,
                  width: 14, semanticsLabel: 'arrow'),
            ),
          ],
        ),
      ),
    );
  }
}
