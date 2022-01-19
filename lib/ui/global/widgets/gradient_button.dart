import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key? key,
      required this.onClick,
      this.buttonText = "try_again",
      this.colors = const [AppColor.dodgerBlue, AppColor.skyBlue],
      this.begin = Alignment.bottomLeft,
      this.end = Alignment.topRight})
      : super(key: key);

  final Function onClick;
  final String buttonText;
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 53),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
                colors: [AppColor.dodgerBlue, AppColor.skyBlue],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: AppText(
          text: buttonText.tr,
          style: TextTypes.headline6,
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
