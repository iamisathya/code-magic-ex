import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/component/loader.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Gradient gradient;
  final double width;
  final double height;
  final String label;
  final bool isLoading;
  final Function onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.gradient,
    this.width = double.infinity,
    this.height = 54.0,
    this.label = "Login",
    this.isLoading = false,
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
            child: Stack(
              children: [
                Center(
                  child: AppText(
                    text: label,
                    style: TextTypes.bodyText1,
                    color: AppColor.kWhiteColor,
                  ),
                ),
                if(isLoading)
                Align(
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 150),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(kAnimatedSpin),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
