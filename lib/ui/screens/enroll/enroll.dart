import 'package:code_magic_ex/ui/screens/enroll/screens/enroll/components/body.dart';
import 'package:flutter/material.dart';

import '../../global/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';


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
