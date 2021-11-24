import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';

//Enum for different text types, you can add more
enum TextType { sm, body, subtitle, title, xl }

// Inspired by VelocityX
// Scale factors as found in VelocityX package
const double scaleFactorBase = 1;
const double scaleFactorLg = 1.120;
const double scaleFactorXl = 1.25;
const double scaleFactorXl2 = 1.5;
const double scaleFactorXl3 = 1.875;
const double scaleFactorXl4 = 2.25;
const double scaleFactorXl5 = 3;
const double scaleFactorXl6 = 4;

class AppText extends StatelessWidget {
  //some common attributes. You can change as needed
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign align;
  final FontWeight weight;
  final bool underline;

  const AppText(
      {required this.text,
      this.color = AppColor.kBlackColor,
      this.align = TextAlign.start,
      this.fontSize = 14.0,
      this.weight = FontWeight.normal,
      this.underline = false});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(color: color, fontSize: fontSize, fontWeight: weight),
        textAlign: align);
  }
}
