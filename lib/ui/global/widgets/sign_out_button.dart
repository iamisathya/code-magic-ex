import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilities/images.dart';

class SignOutButton extends StatelessWidget {
  final double fontSize;
  final String title;
  final double height;
  final Color bgColor;
  final Color fgColor;
  final Color iconColor;
  final VoidCallback? onPress;
  final String icon;
  const SignOutButton(
      {this.fontSize = 14,
      this.title = "Button",
      this.height = 40,
      this.bgColor = const Color(0xFFFFB74F),
      this.fgColor = const Color(0xFF000000),
      this.iconColor = const Color(0xFF000000),
      this.icon = kSignOutIcon,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(100, height)),
          backgroundColor: MaterialStateProperty.all<Color>(
            bgColor,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            fgColor,
          ),
          textStyle: MaterialStateProperty.all<TextStyle?>(
              TextStyle(fontSize: fontSize))),
      onPressed: () => onPress!(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Text(
            title,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SvgPicture.asset(
          icon,
          width: 20,
          color: iconColor,
        ),
      ]),
    );
  }
}
