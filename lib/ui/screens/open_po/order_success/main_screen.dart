import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/screens/open_po/order_success/controller/openpo_order_success.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class CreateOpenPoOrderResult extends StatelessWidget {
  static const String routeName = '/createOpenPoOrderResult';
  final OpenPoOrderResultController _controller =
      Get.put(OpenPoOrderResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _controller.onPressedBack,
        ),
        title: Text(
          "order_success".tr,
          style: const TextStyle(color: AppColor.kBlackColor),
        ),
      ),
      body: Body(),
    );
  }
}
