import 'dart:ui';

import 'package:flutter/material.dart';

class RectangleButtonWidget extends StatelessWidget {
  final String title;
  final bool rounded;
  final EdgeInsets padding;
  final Color backgroundColor;
  final GestureTapCallback onPressed;
  final TextStyle textStyle;
  final ShapeBorder shape;
  final double elevation;
  final BoxConstraints boxConstraints;
  final MaterialTapTargetSize materialTapTargetSize;
  final Widget leadingIcon;
  final Widget trailingIcon;
  final bool disableRipple;

  const RectangleButtonWidget({
    required this.title,
    required this.onPressed,
    this.rounded = false,
    this.padding = const EdgeInsets.symmetric(vertical: 7.5, horizontal: 17.5),
    this.backgroundColor = Colors.blueAccent,
    this.textStyle = const TextStyle(),
    this.shape = const RoundedRectangleBorder(),
    this.elevation = 0,
    this.boxConstraints = const BoxConstraints(),
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
    this.leadingIcon = const CircularProgressIndicator(),
    this.trailingIcon = null,
    this.disableRipple = false,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: elevation,
      fillColor: backgroundColor ?? Theme.of(context).primaryColor,
      onPressed: onPressed,
      shape: shape ??
          (rounded ? const StadiumBorder() : const RoundedRectangleBorder()),
      constraints: boxConstraints ?? BoxConstraints(),
      materialTapTargetSize: materialTapTargetSize,
      padding: padding,
      highlightColor:
          disableRipple ? Colors.transparent : Theme.of(context).highlightColor,
      splashColor:
          disableRipple ? Colors.transparent : Theme.of(context).splashColor,
      highlightElevation: disableRipple ? 0 : elevation,
      child: (leadingIcon != null || trailingIcon != null)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (leadingIcon != null) leadingIcon,
                if (title != null && title.isNotEmpty)
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: leadingIcon != null ? 5 : 0,
                          right: trailingIcon != null ? 5 : 0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: textStyle ??
                            TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: AppFontWeight.semiBold),
                      ),
                    ),
                  ),
                if (trailingIcon != null) trailingIcon,
              ],
            )
          : Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle ??
                  TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: AppFontWeight.semiBold),
            ),
    );
  }
}
