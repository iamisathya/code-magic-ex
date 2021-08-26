import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'components/body.dart';
import 'controller/easyship.controller.dart';

class EasyShipHomeScreen extends StatelessWidget {
  final EasyShipController controller = Get.put(EasyShipController());
  static const String routeName = '/easyShipReportsHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "easyship".tr,
          action: [
            _appBarActions(),
          ],
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }

  IconButton _appBarActions() {
    return IconButton(
      icon: Icon(
        Icons.open_in_new_outlined,
        color: Theme.of(Get.context!).colorScheme.primary,
      ),
      tooltip: 'Export as xlsl',
      onPressed: controller.onTapExportExcellSheet,
    );
  }
}
