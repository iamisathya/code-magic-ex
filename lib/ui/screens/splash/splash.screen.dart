import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                child: Image.asset(
                  kUnicityGradient3xImage,
                  width: getProportionateScreenWidth(250),
                  semanticLabel: "unicity logo",
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
