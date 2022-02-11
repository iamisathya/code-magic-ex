import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../core/values/colors.dart';
import '../utils/connectivity.dart';
import '../utils/images.dart';
import 'gradient_button.dart';

class NoConnectionScreen extends StatelessWidget {
  NoConnectionScreen({Key? key}) : super(key: key);
  final NoConnectionController controller = Get.put(NoConnectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(kEnrolmentSuccessImage),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(20.0),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: AppColor.dodgerBlue)
                      : GradientButton(
                          onClick: controller.checkConnection,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoConnectionController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> checkConnection() async {
    isLoading.toggle();
    await ConnectivityManager.shared.doInitialCheck();
    Timer(const Duration(seconds: 2), () {
      isLoading.toggle();
      if (ConnectivityManager.shared.isAvailable()) {
        Get.back();
      }
    });
  }
}
