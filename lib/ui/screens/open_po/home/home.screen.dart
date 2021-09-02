import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/body2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../controller/openpo.controller.dart';

class OpenPOHomeScreen extends StatelessWidget {
  final OpenPoController controller = Get.put(OpenPoController());
  static const String routeName = '/openPOHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: Body2(),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            heroTag: "add_open_po_order",
            onPressed: controller.onAddOrderTap,
            child: const Icon(Icons.add)));
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
