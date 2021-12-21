import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barcode/barcode.screen.dart';
import '../../dashboard/screen/dashboard_screen.dart';
import '../../open_po/order_create/home_screen.dart';
import '../../order_entry/orderentry.screen.dart';
import '../../sales_reports/salesreports.screen.dart';

class HomeController extends GetxController {
  final RxInt currentTabIndex = 0.obs;
  final PageController pageController = PageController();
  List<Widget> tabPages = [
    Body(),
    SalesReportsHomeScreen(),
    OpenPoCreateOrder(),
    OrderEntryHomeScreen(),
    BarcodeHomeScreen()
  ];

  void onTabTapped(
      {required bool isExternal,
      required String currentPage,
      required int index}) {
    currentTabIndex.value = index;
    if (isExternal && index == 2) {
      Get.toNamed(currentPage);
    } else {
      if (index == 0) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut);
      } else {
        Get.to(() => tabPages[index]);
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}
