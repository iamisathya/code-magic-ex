import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final List<Color> bgColor;
  final Color textColor;

  const AppButton(
      {required this.onTap,
      required this.title,
      this.bgColor = const [AppColor.dodgerBlue, AppColor.skyBlue],
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50,
          width: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: bgColor,
            ),
          ),
          child: Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: textColor))),
    );
  }
}
