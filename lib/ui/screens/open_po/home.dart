import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
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
        appBar: TransAppBar(
          title: "PO List",
          action: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: kMainColor,
            onPressed: controller.onAddOrderTap,
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
