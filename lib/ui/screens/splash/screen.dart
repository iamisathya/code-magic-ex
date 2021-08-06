import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../global/widgets/animated_show_up.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

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
                delay: 500,
                child: Text(
                  "UNICITY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kMainColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
              ),
              AnimatedShowUp(
                delay: 1000,
                child: Text(
                  "OFFICE",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 40),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
