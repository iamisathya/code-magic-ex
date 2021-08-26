import 'package:dsc_tools/constants/font_weights.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/widgets/animated_show_up.dart';
import '../../../utilities/size_config.dart';
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
                child: Text(
                  "UNICITY OFFICE",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 15),
              AnimatedShowUp(
                delay: 700,
                child: Text(
                  "DSC Tools",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: AppFontWeight.semiBold),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
