import 'package:code_magic_ex/ui/screens/open_po/controller/open_po_controller.dart';
import 'package:code_magic_ex/ui/screens/open_po/order_details/components/body.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        iconTheme: const IconThemeData(color: kMainColor),
        title: const Text(
          "Order Details",
          style: TextStyle(color: kMainColor),
        ),
        actions: _renderActionBar(context),
      ),
      body: Body(),
    );
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.print_outlined,
        ),
        tooltip: 'Print',
        onPressed: () => controller.proceedToPrint(context,
            orderId: controller.currentPoNumber),
      ),
    ];
  }
}
