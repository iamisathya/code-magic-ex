import 'package:dsc_tools/ui/screens/open_po/order_create/component/loader.dart';
import 'package:dsc_tools/ui/screens/profile/controller/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../open_po/order_create/component/app_bar.dart';
import '../widgets/body.dart';

class UserProfileScreen extends StatelessWidget {
  static const String routeName = "/userProfileScreen";
  final UserProfileController _controller = Get.put(UserProfileController());
  
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: _controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          appBar: OpenPoAppBar(),
          body: const Body(),
        ),
      ),
    );
  }
}
