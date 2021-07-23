import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/ui/screens/inventory/bloc/bloc.dart';
import 'package:code_magic_ex/ui/screens/inventory/component/body.dart';
import 'package:code_magic_ex/utilities/size_config.dart';
import 'package:code_magic_ex/utilities/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryHomeScreen extends StatelessWidget {
  final InventoryController controller = Get.put(InventoryController());
  static const String routeName = '/inventoryHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "Inventory",
          action: _renderActionBar(context),
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
        onPressed: () {
          controller.onTapExportExcellSheet();
        },
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
          Icons.filter_alt_outlined,
        ),
        tooltip: 'Sort types',
        onPressed: () => controller.showPopupMenu(context),
      ),
    ];
  }
}
