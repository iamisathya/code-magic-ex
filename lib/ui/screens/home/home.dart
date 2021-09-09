import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller/home.controller.dart';

class MainHomeScreen extends StatelessWidget {
  static const String routeName = '/mainHomePage';
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E8ED),
      body: PageView(
        controller: controller.pageController,
        children: controller.tabPages,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (int index) => controller.onTabTapped = index, // new
          currentIndex: controller.onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kMoreIcon, height: 18),
                activeIcon: SvgPicture.asset(kMoreActiveIcon, height: 18),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kStatisticsIcon, height: 22),
                activeIcon: SvgPicture.asset(kStatisticsActiveIcon, height: 22),
                label: 'Enroll'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kCartIcon, height: 22),
                activeIcon: SvgPicture.asset(kCartActiveIcon, height: 22),
                label: 'Order Entry'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kRecordsIcon, height: 22),
                activeIcon: SvgPicture.asset(kRecordsActivecon, height: 22),
                label: 'Easyship Report'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kReportsIcon, height: 22),
                activeIcon: SvgPicture.asset(kReportsActiveIcon, height: 22),
                label: 'Profile')
          ],
        ),
      ),
    );
  }
}
