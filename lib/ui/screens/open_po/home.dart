import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/screens/open_po/bloc/bloc.dart';
import 'package:code_magic_ex/ui/screens/open_po/components/body.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:code_magic_ex/utilities/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenPOHomeScreen extends StatelessWidget {
  final SampleController controller = Get.put(SampleController());
  static const String routeName = '/openPOHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: AppBar(
          title: const Text("PO List"),
          actions: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: kPrimaryLightColor,
            onPressed: () {},
            child: const Icon(Icons.add, color: Colors.white)));
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.sort,
        ),
        tooltip: 'Sort types',
        onPressed: () => controller.showPopupMenu(context),
      ),
    ];
  }
}
