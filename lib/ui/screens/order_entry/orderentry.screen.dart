import 'package:flutter/material.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'screens/home/components/body.dart';

class OrderEntryHomeScreen extends StatelessWidget {
  static const String routeName = '/orderEntryHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TransAppBar(
          title: "Order Entry",
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
