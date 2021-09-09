import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../controller/openpo.controller.dart';
import 'components/app_bar.dart';
import 'components/open_po_order_list.dart';

class OpenPOHomeScreen extends StatelessWidget {
  final OpenPoController controller = Get.put(OpenPoController());
  static const String routeName = '/openPOHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
      appBar: OpenPoAppBar(),
      body: OpenPoOrderList(),
    );
  }
}
