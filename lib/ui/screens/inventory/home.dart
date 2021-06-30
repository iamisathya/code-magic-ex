import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/screens/inventory/component/body.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:code_magic_ex/utilities/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryHomeScreen extends StatelessWidget {
  final SalesReportController controller = Get.put(SalesReportController());
  static const String routeName = '/inventoryHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: AppBar(
          title: const Text("Sales Report"),
          actions: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.open_in_new_outlined,
        ),
        tooltip: 'Export',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.print_outlined,
        ),
        tooltip: 'Print',
        onPressed: () {},
      ),
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
