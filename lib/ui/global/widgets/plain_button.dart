import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color buttonColor;
  final VoidCallback? onTap;

  const PlainButton(
      {required this.title,
      this.titleColor = const Color(0xFFFFFFFF),
      this.buttonColor = const Color(0xFF1C9CFC),
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
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: titleColor)),
      ),
    );
  }
}
