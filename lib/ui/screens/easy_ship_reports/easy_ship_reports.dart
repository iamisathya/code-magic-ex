import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:flutter/material.dart';

class EasyShipHomeScreen extends StatefulWidget {
  static const String routeName = '/easyShipReportsHomePage';

  @override
  _EasyShipHomeScreenState createState() => _EasyShipHomeScreenState();
}

class _EasyShipHomeScreenState extends State<EasyShipHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Easy ship reports"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is home page")));
  }
}
