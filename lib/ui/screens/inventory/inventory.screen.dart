import 'package:dsc_tools/ui/screens/open_po/home/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../../utilities/constants.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'component/body.dart';
import 'component/body_two.dart';
import 'controller/inventory.controller.dart';

class InventoryHomeScreen extends StatelessWidget {
  static const String routeName = '/inventoryHomePage';
  final InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: SafeArea(child: Body2()));
  }
}
