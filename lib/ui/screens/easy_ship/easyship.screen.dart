import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../open_po/home/components/app_bar.dart';
import 'components/body2.dart';
import 'controller/easyship.controller.dart';

class EasyShipHomeScreen extends StatelessWidget {
  final EasyShipController controller = Get.put(EasyShipController());
  static const String routeName = '/easyShipReportsHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: OpenPoAppBar(),
        body: Body());
  }
}
