import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/utilities/size_config.dart';

import 'package:flutter/material.dart';

import 'body.dart';

class OpenPOHomeScreen extends StatelessWidget {
  static const String routeName = '/openPOHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("OpenPO"),
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }
}
