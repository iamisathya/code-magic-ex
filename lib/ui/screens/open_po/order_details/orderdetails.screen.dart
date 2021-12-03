import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../controller/openpo.controller.dart';
import 'components/body.dart';

class PurchaseOrderDetailsPage extends StatelessWidget {
  static const String routeName = '/purchaseOrderDetailsPage';
  final OpenPoController controller = Get.put(OpenPoController());

  PurchaseOrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        title: Text(
          "order_details".tr,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: _renderActionBar(context),
      ),
      body: Body(),
    );
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      if (controller.wasAttachementExists())
        IconButton(
          icon: const Icon(Icons.attach_file_outlined),
          tooltip: 'attachement'.tr,
          onPressed: controller.onTapOpenAttchment,
        )
      else
        const SizedBox(),
      IconButton(
        icon: const Icon(
          Icons.print_outlined,
        ),
        tooltip: 'print'.tr,
        onPressed: () => controller.proceedToPrint(context,
            orderId: controller.openPlaceOrderId.orderOpid),
      ),
    ];
  }
}
