import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';
import '../../global/navigation_drawer.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'bloc/bloc.dart';
import 'components/body.dart';

class EasyShipHomeScreen extends StatelessWidget {
  final EasyShipController controller = Get.put(EasyShipController());
  static const String routeName = '/easyShipReportsHomePage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "Easy Ship",
          action: [
            _appBarActions(),
          ],
        ),
        drawer: NavigationDrawer(),
        body: Body());
  }

  IconButton _appBarActions() {
    return IconButton(
      icon: const Icon(
        Icons.open_in_new_outlined,
        color: kMainColor,
      ),
      tooltip: 'Export as xlsl',
      onPressed: controller.onTapExportExcellSheet,
    );
  }
}
