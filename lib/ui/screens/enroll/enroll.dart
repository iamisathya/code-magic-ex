import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:flutter/material.dart';

class EnrollHomeScreen extends StatelessWidget {
  static const String routeName = '/enrollHomePage';

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
