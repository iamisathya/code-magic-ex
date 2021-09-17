import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'components/body.dart';
import 'controller/login.controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  static const String routeName = '/loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingOverlay(
          isLoading: controller.loading.value,
          progressIndicator: const Loader(),
          child: Body(),
        ),
      ),
    );
  }
}
