import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottom_navigation_bar.dart';
import 'controller/home.controller.dart';

class MainHomeScreen extends StatelessWidget {
  static const String routeName = '/mainHomePage';
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: controller.tabPages,
      ),
      bottomNavigationBar: NavigationBottomBar(controller: controller),
    );
  }
}
