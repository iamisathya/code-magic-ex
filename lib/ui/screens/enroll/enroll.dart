import 'package:flutter/material.dart';

import '../../global/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'screens/enroll/components/body.dart';


class EnrollHomeScreen extends StatelessWidget {
  static const String routeName = '/enrollHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TransAppBar(
          title: "Enroll",
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
