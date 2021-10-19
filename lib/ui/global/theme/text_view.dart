import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  //some common attributes. You can change as needed
  final String text;
  final Color color;
  final TextAlign align;
  final TextTypes style;

  const AppText(
      {required this.text,
      required this.style,
      this.color = const Color(0xFF000000),
      this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: getThemeStyle(style, context).copyWith(color: color),
        textAlign: align);
  }

  TextStyle getThemeStyle(TextTypes style, BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyText2;
    switch (style) {
      case TextTypes.headline1:
        textStyle = Theme.of(context).textTheme.headline1;
        break;
      case TextTypes.headline2:
        textStyle = Theme.of(context).textTheme.headline2;
        break;
      case TextTypes.headline3:
        textStyle = Theme.of(context).textTheme.headline3;
        break;
      case TextTypes.headline4:
        textStyle = Theme.of(context).textTheme.headline4;
        break;
      case TextTypes.headline5:
        textStyle = Theme.of(context).textTheme.headline5;
        break;
      case TextTypes.headline6:
        textStyle = Theme.of(context).textTheme.headline6;
        break;
      case TextTypes.subtitle1:
        textStyle = Theme.of(context).textTheme.subtitle1;
        break;
      case TextTypes.subtitle2:
        textStyle = Theme.of(context).textTheme.subtitle2;
        break;
      case TextTypes.bodyText1:
        textStyle = Theme.of(context).textTheme.bodyText1;
        break;
      case TextTypes.bodyText2:
        textStyle = Theme.of(context).textTheme.bodyText2;
        break;
      case TextTypes.caption:
        textStyle = Theme.of(context).textTheme.caption;
        break;
      case TextTypes.button:
        textStyle = Theme.of(context).textTheme.button;
        break;
      case TextTypes.overline:
        textStyle = Theme.of(context).textTheme.overline;
        break;
      default:
        textStyle = Theme.of(context).textTheme.bodyText2;
    }
    return textStyle!;
  }
}
