import 'package:dsc_tools/ui/screens/barcode/barcode.screen.dart';
import 'package:dsc_tools/ui/screens/open_po/order_create/home_screen.dart';
import 'package:dsc_tools/ui/screens/order_entry/orderentry.screen.dart';
import 'package:dsc_tools/ui/screens/sales_reports/salesreports.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/screen/dashboard_screen.dart';

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
      if(index == 0) {
        pageController.animateToPage(index,
          duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
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
