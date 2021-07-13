import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/screens/enroll/components/body.dart';
import 'package:code_magic_ex/utilities/constants.dart';

class EnrollHomeScreen extends StatelessWidget {
  static const String routeName = '/enrollHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPageBackground,
        appBar: const TransAppBar(
          title: "Enroll",
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
