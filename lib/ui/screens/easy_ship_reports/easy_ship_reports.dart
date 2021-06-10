import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:flutter/material.dart';

class EasyShipReportsHomeScreen extends StatelessWidget {
  static const String routeName = '/easyShipReportsHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is home page")));
  }
}
