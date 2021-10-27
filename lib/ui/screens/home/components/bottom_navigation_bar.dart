import 'package:dsc_tools/ui/screens/home/controller/home.controller.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 28,
              color: Colors.grey
            ),
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
            onTap: (int index) => controller.onTabTapped = index, // new
            currentIndex: controller.onTabTapped,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabHomeIcon, height: 20),
                  activeIcon: SvgPicture.asset(kBottomTabHomeIcon, height: 20),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabSalesReportIcon, height: 20),
                  activeIcon: SvgPicture.asset(kBottomTabSalesReportActiveIcon,
                      height: 20),
                  label: 'Enroll'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabAddIcon, height: 60),
                  activeIcon: SvgPicture.asset(kBottomTabAddIcon, height: 60),
                  label: 'Order Entry'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabOrderEntryIcon, height: 20),
                  activeIcon: SvgPicture.asset(kBottomTabOrderEntryActvieIcon,
                      height: 20),
                  label: 'Easyship Report'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(kBottomTabBarcodeIcon, height: 20),
                  activeIcon:
                      SvgPicture.asset(kBottomTabBarcodeActiveIcon, height: 20),
                  label: 'Profile')
            ],
          ),
        ),
      ),
    );
  }
}
