import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlainButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color buttonColor;
  final bool showIcons;
  final VoidCallback? onTap;

  const PlainButton(
      {required this.title,
      this.titleColor = const Color(0xFFFFFFFF),
      this.buttonColor = const Color(0xFF1C9CFC),
      this.showIcons = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : null,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0), color: buttonColor),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: showIcons ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center, 
            children: [
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: titleColor)),
              if(showIcons) SvgPicture.asset(kForwardIcon, width: 34, height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
