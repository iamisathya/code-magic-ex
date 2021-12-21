import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/openpo.list.controller.dart';
import 'header_bar.dart';
import 'openpo_list.dart';
import 'po_list_toolbar.dart';

class OpenPoOrderList extends StatelessWidget {
  final OpenPoListController controller = Get.put(OpenPoListController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderBar(),
          PoListToolBar(controller: controller),
          OpenPoList(controller: controller)
        ],
      ),
    );
  }
}
