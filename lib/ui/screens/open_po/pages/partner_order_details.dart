import 'package:code_magic_ex/models/open_po_details.dart';
import 'package:code_magic_ex/ui/screens/github/custom_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/open_po/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/utilities/extensions.dart';

import 'package:get/get.dart';

class PurchaseOrderDetailsPage extends StatelessWidget {
  static const String routeName = '/purchaseOrderDetailsPage';
  final SampleController controller = Get.put(SampleController());

  PurchaseOrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
      appBar: AppBar(
        title: const Text("Order Details"),
        actions: _renderActionBar(context),
      ),
      body: SingleChildScrollView(child: _renderChild(context)),
    );
  }

  Widget _renderChild(BuildContext context) {
    if (controller.loadingDetails.value == true) {
      return const CustomLoadingWidget(
        svgIcon: kImageApproveTask,
      );
    } else {
      return AnimatedContainer(
        duration: kAnimationDuration,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _renderRowItem(
                "DSC Information", controller.openPlaceOrderId.orderDscid),
            _renderRowItem("Date", controller.openPlaceOrderId.orderDate),
            _renderRowItem("DSC Name", controller.openPlaceOrderId.createBy),
            _renderProductCards(context),
            _renderDividerPadding(),
            _renderTotal(context),
            _renderDividerPadding(),
          ],
        ),
      );
    }
  }

  Padding _renderDividerPadding() {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Divider(
        thickness: 1,
        indent: 4,
        color: Colors.black,
      ),
    );
  }

  Column _renderTotal(BuildContext context) {
    return Column(children: [
      Padding(
        padding: kEdgeV12H16(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total PV: ",
              style: Theme.of(context).textTheme.productTitle,
            ),
            Text(
              controller.openPlaceOrderId.orderTotalPv,
              style: Theme.of(context).textTheme.productTitle,
            ),
          ],
        ),
      ),
      Padding(
        padding: kEdgeV12H16(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total Price: ",
              style: Theme.of(context).textTheme.productTitle,
            ),
            Text(
              controller.openPlaceOrderId.orderTotalPrice,
              style: Theme.of(context).textTheme.productTitle,
            ),
          ],
        ),
      )
    ]);
  }

  ListView _renderProductCards(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.openPlaceOrderDetails.length,
        itemBuilder: (context, position) {
          return _renderProductItem(
              controller.openPlaceOrderDetails[position], context);
        });
  }

  Card _renderProductItem(OpenPlaceOrderDetails item, BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kEdgeV12H16(),
            child: Text(
              item.productName,
              style: Theme.of(context).textTheme.productTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "Product Code : ",
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  item.productId,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          _renderCardItemRow("Qty Order	", ": ${item.productQty}", context),
          _renderCardItemRow("PV", ": ${item.totalPv}", context),
          _renderCardItemRow("Item Price", ": ${item.productPrice}", context),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Expanded(
                  child: _renderCardItemBottomRow(
                      "Total PV :", item.totalPv.toString(), context, 16)),
              Expanded(
                  child: _renderCardItemBottomRow(
                      "Total Price :", " ${item.totalPrice}", context, 0)),
            ],
          ),
        ],
      ),
    );
  }

  Padding _renderCardItemRow(String title, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: Theme.of(context).textTheme.cardItemTitle)),
          Expanded(
              child:
                  Text(value, style: Theme.of(context).textTheme.cardItemTitle))
        ],
      ),
    );
  }

  Padding _renderCardItemBottomRow(
      String title, String value, BuildContext context, double horPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: horPadding),
      child: Row(
        children: [
          SizedBox(
              width: 100,
              child: Text(title,
                  style: Theme.of(context).textTheme.cardItemTitle)),
          Expanded(
              child: Text(value, style: Theme.of(context).textTheme.button))
        ],
      ),
    );
  }

  Padding _renderRowItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(16),
            decoration: normalBoxDecoration(),
            child: Text(value),
          )),
        ],
      ),
    );
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.print_outlined,
        ),
        tooltip: 'Print',
        onPressed: () =>
            controller.proceedToPrint(orderId: controller.currentPoNumber),
      ),
    ];
  }
}
