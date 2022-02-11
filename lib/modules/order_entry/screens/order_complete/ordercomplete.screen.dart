import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/colors.dart';
import '../../../../widgets/transparent_app_bar.dart';
import '../../controllers/ordercomplete.controller.dart';
import 'components/body.dart';

class OrderComplete extends StatelessWidget {
  final OrderCompleteController controller = Get.put(OrderCompleteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: TransAppBar(
          title: "ordercomplete".tr, action: _renderActionBar(context)),
      body: SafeArea(child: Body()),
    );
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: const Icon(
            Icons.qr_code_2_outlined,
          ),
          tooltip: 'open qr code',
          onPressed: () => controller.openBarCode()),
    ];
  }
}
