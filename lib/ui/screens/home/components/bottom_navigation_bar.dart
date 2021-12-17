import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/images.dart';
import '../controller/home.controller.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({
    Key? key,
    required this.controller,
    this.isExternal = false,
    this.currentPage = "",
  }) : super(key: key);

  final HomeController controller;
  final bool isExternal;
  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 28, color: Colors.grey),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 20,
            iconSize: 20,
            onTap: (int index) => controller.onTabTapped(
                index: index,
                isExternal: isExternal,
                currentPage: currentPage), // new
            currentIndex: controller.currentTabIndex.value,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabHomeIcon, height: 20),
                  activeIcon: SvgPicture.asset(kBottomTabHomeActiveIcon, height: 20),
                  label: 'home'.tr),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabSalesReportIcon, height: 20),
                  activeIcon: SvgPicture.asset(kBottomTabSalesReportActiveIcon,
                      height: 20),
                  label: 'enrol'.tr),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabAddIcon, height: 60),
                  activeIcon: SvgPicture.asset(kBottomTabAddIcon, height: 60),
                  label: 'order_entry'.tr),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabOrderEntryIcon, height: 20),
                  activeIcon: SvgPicture.asset(kBottomTabOrderEntryActvieIcon,
                      height: 20),
                  label: 'easyship_report'.tr),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabBarcodeIcon, height: 20),
                  activeIcon:
                      SvgPicture.asset(kBottomTabBarcodeActiveIcon, height: 20),
                  label: 'profile'.tr)
            ],
          ),
        ),
      ),
    );
  }
}
