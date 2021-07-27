import 'package:code_magic_ex/ui/global/widgets/animated_show_up.dart';
import 'package:code_magic_ex/ui/screens/splash/controller/splash_controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              ),
              AnimatedShowUp(
                delay: 2000,
                child: Text(
                  "OFFICE",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 30),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
