import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/screen/dashboard_screen.dart';

class HomeController extends GetxController {
  final RxInt currentTabIndex = 0.obs;
  final PageController pageController = PageController();
  List<Widget> tabPages = [
    Body(),
    Center(child: Text("home".tr)),
    Center(child: Text("sales_report".tr)),
    Center(child: Text("order_entry".tr)),
    Center(child: Text("barcode".tr)),
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
