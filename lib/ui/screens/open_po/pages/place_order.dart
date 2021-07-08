import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/ui/screens/open_po/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class PlaceOrderHomePage extends StatelessWidget {
  final ProgressBar _sendingMsgProgressBar = ProgressBar();
  final SampleController controller = Get.put(SampleController());
  static const String routeName = '/placeOrderHomePage';

  void showSendingProgressBar(BuildContext context) {
    _sendingMsgProgressBar.show(context);
  }

  void hideSendingProgressBar() {
    _sendingMsgProgressBar.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
      appBar: AppBar(
        title: const Text("Create Order"),
      ),
      body: GetBuilder<SampleController>(
          init: SampleController(),
          initState: (state) {
            controller.loadInventoryRecords();
          },
          builder: (_) {
            return Container(
              child: _renderDataTable(context),
            );
          }),
    );
  }

  Widget _renderDataTable(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: Get.height,
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 150,
              rightHandSideColumnWidth: 1200,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: controller.cartProducts.length,
              rowSeparatorWidget: kRowDivider,
            ),
          ),
        ),
        if (controller.cartProducts.isNotEmpty) _renderCartFooter(context),
      ],
    );
  }

  Container _renderCartFooter(BuildContext context) {
    return Container(
        padding: kEdgeV12H16(),
        color: Colors.black54,
        width: Get.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Total Price: ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      controller.totalCartPrice().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Total PV: ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      controller.totalCartPv().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor, padding: kEdgeA12()),
              onPressed: () {
                if (!controller.isEmptyCart) {
                  controller.validateOrder(context);
                }
              },
              child: const Text("Place Order"),
            ),
          ],
        ));
  }

  List<Widget> _getTitleWidget() {
    return [
      _renderTableHeader("Item Code", 150),
      _renderTableHeader("Product Name", 300),
      _renderTableHeader("Qty Order", 150),
      _renderTableHeader("PV", 150),
      _renderTableHeader("Item Price", 200),
      _renderTableHeader("Total PV", 200),
      _renderTableHeader("Total Price", 200),
    ];
  }

  TextButton _renderTableHeader(String title, double width) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {},
      child: _getTitleItemWidget(
        title,
        width,
      ),
    );
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryLightColor, border: Border.all(width: 0.5)),
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.cartProducts[index];
    return GestureDetector(
        onTap: () {
          controller.getOpenPlaceOrderDetails(currentItem.itemCode, context);
        },
        child: Container(
          width: 150,
          height: 65,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 0.5)),
          child: renderAutoComplete(index),
        ));
  }

  Widget _renderCounterButton(int quantity, String itemCode) {
    return Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              controller.updateQuantity(CartUpdate.decreament, itemCode);
            },
            mini: true,
            backgroundColor: Colors.white,
            child: const Text("-",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
          ),
          Text('$quantity', style: const TextStyle(fontSize: 18.0)),
          FloatingActionButton(
            onPressed: () {
              controller.updateQuantity(CartUpdate.increament, itemCode);
            },
            mini: true,
            backgroundColor: Colors.white,
            child: const Text("+",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
          ),
        ]));
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.cartProducts[index];
    final bool isEmptyQty = currentItem.quantity == 0;

    return GestureDetector(
      onTap: () {
        controller.getOpenPlaceOrderDetails(currentItem.itemCode, context);
      },
      child: Row(
        children: <Widget>[
          _renderDataCell(300, currentItem.productName),
          _renderContainerWidget(isEmptyQty
              ? const Center()
              : Center(
                  child: _renderCounterButton(
                      currentItem.quantity, currentItem.itemCode))),
          _renderDataCell(
              150, isEmptyQty ? "" : Parsing.stringFrom(currentItem.itemPv)),
          _renderDataCell(
              200, isEmptyQty ? "" : Parsing.stringFrom(currentItem.itemPrice)),
          _renderDataCell(
              200, isEmptyQty ? "" : Parsing.stringFrom(currentItem.totalPv)),
          _renderDataCell(200,
              isEmptyQty ? "" : Parsing.stringFrom(currentItem.totalPrice)),
        ],
      ),
    );
  }

  Container _renderContainerWidget(Widget widget) {
    return Container(
        width: 150,
        height: 65,
        decoration: BoxDecoration(border: Border.all(width: 0.5)),
        child: widget);
  }

  Container _renderDataCell(double width, String titleText) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(titleText),
      ),
    );
  }

  Autocomplete renderAutoComplete(int idx) {
    String _displayStringForOption(InventoryRecordItems option) =>
        option.item.id.unicity;

    return Autocomplete<InventoryRecordItems>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<InventoryRecordItems>.empty();
        }
        return controller.fetchInventoryRecords.items
            .where((InventoryRecordItems option) {
          return option.toString().contains(textEditingValue.text);
        });
      },
      onSelected: (InventoryRecordItems item) {
        controller.addItemToCart(
            itemCode: _displayStringForOption(item), index: idx);
      },
    );
  }
}
