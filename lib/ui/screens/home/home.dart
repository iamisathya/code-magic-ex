import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';

class MainHomeScreen extends StatefulWidget {
  static const String routeName = '/mainHomePage';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransAppBar(
          title: "home".tr,
          action: const [
            IconButton(
              icon: Icon(
                Icons.mode_night_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                Icons.translate_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: null,
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: Center(
          child: Column(
            children: const [
              Text("DASHBOARD"),
            ],
          ),
        ));
  }
}

extension PopupMenuItemExtension on PopupMenuItem {}
