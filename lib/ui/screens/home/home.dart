import 'package:flutter/material.dart';

import '../dashboard/screen/dashboard_screen.dart';

class MainHomeScreen extends StatelessWidget {
  static const String routeName = '/mainHomePage';
  // final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: Colors.white,
      body: Body(),
      // bottomNavigationBar: NavigationBottomBar(controller: controller),
    );
  }
}
