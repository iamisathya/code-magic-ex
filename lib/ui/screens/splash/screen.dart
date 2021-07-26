import 'package:code_magic_ex/ui/screens/splash/controller/splash_controller.dart';
import 'package:code_magic_ex/utilities/images.dart';
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
          child: Image.asset(kSplashImage, fit: BoxFit.cover),
        ),
        Obx(() => Align(
          child: FlutterLogo(
            size: 200.0,
            style: controller.logoStyle.value,
          ),
        ))
      ]),
    );
  }
}
