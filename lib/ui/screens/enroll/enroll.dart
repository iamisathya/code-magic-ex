import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/screens/enroll/components/body.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

class EnrollHomeScreen extends StatelessWidget {
  static const String routeName = '/enrollHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kMainColor),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Enroll", style: TextStyle(color: kMainColor),),
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
