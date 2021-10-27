import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/screen/dashboard_screen.dart';

class HomeController extends GetxController {
  final RxInt currentTabIndex = 0.obs;
  final PageController pageController = PageController();
  List<Widget> tabPages = [
    Body(),
    const Center(child: Text("Home")),
    const Center(child: Text("Sales Report")),
    const Center(child: Text("Order Entry")),
    const Center(child: Text("Barcode")),
  ];

  void onTabTapped(
      {required bool isExternal,
      required String currentPage,
      required int index}) {
    currentTabIndex.value = index;
    if (isExternal && index == 2) {
      Get.toNamed(currentPage);
    } else {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}
