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
              icon: SvgPicture.asset(kDashboardIcon, height: 18),
              activeIcon: SvgPicture.asset(kDashboardActiveIcon, height: 18),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(kLeaderboardIcon, height: 22),
              activeIcon: SvgPicture.asset(kLeaderboardActiveIcon, height: 22),
              label: 'Enroll',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kCartIcon, height: 22),
                activeIcon: SvgPicture.asset(kOrderEntryActiveIcon, height: 22),
                label: 'Order Entry'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kEasyshipIcon, height: 22),
                activeIcon: SvgPicture.asset(kEasyshipActiveIcon, height: 22),
                label: 'Easyship Report'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(kProfileIcon, height: 22),
                activeIcon: SvgPicture.asset(kProfileActiveIcon, height: 22),
                label: 'Profile')
          ],
        ),
      ),
    );
  }
}