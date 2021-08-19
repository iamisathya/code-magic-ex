import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../global/widgets/animated_show_up.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            color: Colors.white,
          ),
        ),
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AnimatedShowUp(
                delay: 300,
                child: Text(
                  "UNICITY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kMainColor,
                      fontSize: 70,
                      fontWeight: FontWeight.w700),
                ),
              ),
              AnimatedShowUp(
                delay: 700,
                child: Text(
                  "OFFICE",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 55),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
