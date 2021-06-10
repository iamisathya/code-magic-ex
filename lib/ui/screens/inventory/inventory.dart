import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:flutter/material.dart';

class InventoryHomeScreen extends StatelessWidget {
  static const String routeName = '/inventoryHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sales Reports"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is sales reports page")));
  }
}
