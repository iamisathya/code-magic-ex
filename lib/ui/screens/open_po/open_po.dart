import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:flutter/material.dart';

class OpenPOHomeScreen extends StatelessWidget {
  static const String routeName = '/openPOHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("OpenPO"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is OpenPO page")));
  }
}
