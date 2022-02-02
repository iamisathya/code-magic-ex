import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Gradient gradient;
  final double width;
  final double height;
  final String label;
  final Function onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.gradient,
    this.width = double.infinity,
    this.height = 54.0,
    this.label = "Login",
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(3)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () => onPressed(),
            child: Center(
              child: AppText(
                text: label,
                style: TextTypes.bodyText1,
                color: AppColor.kWhiteColor,
              ),
            )),
      ),
    );
  }
}
