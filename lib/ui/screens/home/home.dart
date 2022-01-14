import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard/screen/dashboard_screen.dart';
import 'controller/home.controller.dart';

class MainHomeScreen extends StatelessWidget {
  static const String routeName = '/mainHomePage';
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
