import 'package:dsc_tools/ui/screens/dashboard/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _currentTabIndex = 0.obs;
  final PageController pageController  = PageController();
   List<Widget> tabPages = [
    Body(),
    const Center(child: Text("Statistics")),
    const Center(child: Text("Cart")),
    const Center(child: Text("Reports")),
    const Center(child: Text("Records")),
  ];

  int get onTabTapped => _currentTabIndex.value;

  set onTabTapped(int value) {
    _currentTabIndex.value = value;
    pageController.animateToPage(value, duration: const Duration(milliseconds: 100),curve: Curves.easeInOut);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}
