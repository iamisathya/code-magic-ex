import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../utilities/images.dart';
import '../../../utilities/size_config.dart';
import '../../global/widgets/animated_show_up.dart';
import 'controller/splash.controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColor.ateneoBlue,
      body: Stack(children: [
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedShowUp(
                delay: 300,
                child: SvgPicture.asset(
                  kUnicityLogoGradientImage,
                  width: getProportionateScreenWidth(250),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
