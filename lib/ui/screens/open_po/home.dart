import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/screens/open_po/bloc/bloc.dart';
import 'package:code_magic_ex/ui/screens/open_po/components/body.dart';
import 'package:code_magic_ex/ui/screens/open_po/pages/place_order.dart';
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
          backgroundColor: Colors.white,
          title: const Text("PO List", style: TextStyle(color: kMainColor)),
          actions: _renderActionBar(context),
          elevation: 0,
          iconTheme: const IconThemeData(color: kMainColor),
        ),
        drawer: NavigationDrawer(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: kMainColor,
            onPressed: () => Get.to(PlaceOrderHomePage()),
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
