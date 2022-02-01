import 'package:dsc_tools/utilities/connectivity.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'widgets/gradient_button.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

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
            Container(
              height: 90,
              padding: const EdgeInsets.all(20.0),
              child: GradientButton(
                onClick: () {
                  if (ConnectivityManager.shared.isAvailable()) {
                    Get.back();
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
